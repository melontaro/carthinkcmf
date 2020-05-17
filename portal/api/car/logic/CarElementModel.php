<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: pl125 <xskjs888@163.com>
// +----------------------------------------------------------------------

namespace api\car\logic;

use api\car\model\CarElementModel as CarElement;
use think\Db;
class CarElementModel extends CarElement
{
    /**
     * 获取相关车
     * @param int|string|array $elementIds 车id
     * @return array
     */
    public function getRelationElements($elementIds)
    {
        $elements = $this->with('elementUser')
            ->field('id,element_title,user_id,is_top,element_hits,element_like,comment_count,more')
            ->whereIn('id', $elementIds)
            ->select();
        foreach ($elements as $element) {
            $element->appendRelationAttr('elementUser', 'user_nickname');
        }
        return $elements;
    }
    /**
     * 获取用户车
     */
    public function getUserElements($userId, $params)
    {
        $where = [
            'element_type' => 1,
            'user_id'   => $userId
        ];
        if (!empty($params)) {
            $this->paramsFilter($params);
        }
        return $this->where($where)->select();
    }

    /**
     * 会员添加车
     * @param array $data 车数据
     * @return $this
     */
    public function addElement($data)
    {
    	//设置图片附件，写入字段过滤
    	$dataField  =   $this->setMoreField($data);
    	$data       =   $dataField[0];
	    array_push($dataField[1],'user_id');
	    $this->readonly = array_diff(['user_id'],$this->readonly);
        $this->allowField($dataField[1])->data($data, true)->isUpdate(false)->save();
        $brands = $this->strToArr($data['brands']);
        $this->brands()->attach($brands);
        if (!empty($data['element_keywords']) && is_string($data['element_keywords'])) {
            //加入标签
            $data['element_keywords'] = str_replace('，', ',', $data['element_keywords']);
            $keywords              = explode(',', $data['element_keywords']);
            $this->addTags($keywords, $this->id);
        }
        return $this;
    }

    /**
     * 会员车编辑
     * @param array $data 车数据
     * @param int $id 车id
     * @param int $userId 车所属用户id [可选]
     * @return boolean   成功 true 失败 false
     */
    public function editElement($data, $id, $userId = '')
    {
        if (!empty($userId)) {
            $isBelong = $this->isuserElement($id, $userId);
            if ($isBelong === false) {
                return $isBelong;
            }
        }
	    //设置图片附件，写入字段过滤
	    $dataField             = $this->setMoreField($data);
        $data                  = $dataField[0];
        $data['id']            = $id;
        $this->allowField($dataField[1])->data($data, true)->isUpdate(true)->save();

        $brands            = $this->strToArr($data['brands']);
        $oldBrandIds        = $this->brands()->column('brand_id');
        $sameBrandIds       = array_intersect($brands, $oldBrandIds);
        $needDeleteBrandIds = array_diff($oldBrandIds, $sameBrandIds);
        $newBrandIds        = array_diff($brands, $sameBrandIds);
        if (!empty($needDeleteBrandIds)) {
            $this->brands()->detach($needDeleteBrandIds);
        }
        if (!empty($newBrandIds)) {
            $this->brands()->attach(array_values($newBrandIds));
        }
        if (!isset($data['element_keywords'])) {
	        $keywords = [];
        } elseif (is_string($data['element_keywords'])) {
            //加入标签
            $data['element_keywords'] = str_replace('，', ',', $data['element_keywords']);
            $keywords              = explode(',', $data['element_keywords']);
        }
        $this->addTags($keywords, $data['id']);
        return $this;
    }

    /**
     * 根据车关键字，增加标签
     * @param array $keywords 车关键字数组
     * @param int $elementId 车id
     * @return void
     */
    public function addTags($keywords, $elementId)
    {
        foreach ($keywords as $key => $value) {
            $keywords[$key] = trim($value);
        }
        $continue = true;
        $names    = $this->tags()->column('name');
        if (!empty($keywords) || !empty($names)) {
            if (!empty($names)) {
                $sameNames         = array_intersect($keywords, $names);
                $keywords          = array_diff($keywords, $sameNames);
                $shouldDeleteNames = array_diff($names, $sameNames);
                if (!empty($shouldDeleteNames)) {
                    $tagIdNames = $this->tags()
                        ->where('name', 'in', $shouldDeleteNames)
                        ->column('pivot.id', 'tag_id');
                    $tagIds     = array_keys($tagIdNames);
                    $tagElementIds = array_values($tagIdNames);
                    $tagElements   = DB::name('car_tag_element')->where('tag_id', 'in', $tagIds)
                        ->field('id,tag_id,element_id')
                        ->select();
                    $keepTagIds = [];
                    foreach ($tagElements as $key => $tagElement) {
                        if ($elementId != $tagElement['element_id']) {
                            array_push($keepTagIds, $tagElement['tag_id']);
                        }
                    }
                    $keepTagIds         = array_unique($keepTagIds);
                    $shouldDeleteTagIds = array_diff($tagIds, $keepTagIds);
                    DB::name('CarTag')->delete($shouldDeleteTagIds);
                    DB::name('CarTagElement')->delete($tagElementIds);
                }
            } else {
                $tagIdNames = DB::name('car_tag')->where('name', 'in', $keywords)->column('name', 'id');
                if (!empty($tagIdNames)) {
                    $tagIds = array_keys($tagIdNames);
                    $this->tags()->attach($tagIds);
                    $keywords = array_diff($keywords, array_values($tagIdNames));
                    if (empty($keywords)) {
                        $continue = false;
                    }
                }
            }
            if ($continue) {
                foreach ($keywords as $key => $value) {
                    if (!empty($value)) {
                        $this->tags()->attach(['name' => $value]);
                    }
                }
            }
        }
    }

	/**
	 * 设置缩略图，图片，附件
	 * 懒人方法
	 * @param $data 表单数据
	 */
	public function setMoreField($data)
	{
		$allowField = [
			'element_title','element_keywords','element_source',
			'element_excerpt','element_content','more',
			'published_time'
		];
		if (!empty($data['more'])) {
			$data['more'] = $this->setMoreUrl($data['more']);
		}
		if (!empty($data['thumbnail'])) {
			$data['more']['thumbnail'] = cmf_asset_relative_url($data['thumbnail']);
		}
		return [$data,$allowField];
	}

    /**
     * 获取图片附件url相对地址
     * 默认上传名字 *_names  地址 *_urls
     * @param $annex 上传附件
     * @return array
     */
    public function setMoreUrl($annex)
    {
        $more = [];
        if (!empty($annex)) {
            foreach ($annex as $key => $value) {
                $nameArr = $key . '_names';
                $urlArr  = $key . '_urls';
                if (is_string($value[$nameArr]) && is_string($value[$urlArr])) {
                    $more[$key] = [$value[$nameArr], $value[$urlArr]];
                } elseif (!empty($value[$nameArr]) && !empty($value[$urlArr])) {
                    $more[$key] = [];
                    foreach ($value[$urlArr] as $k => $url) {
                        $url = cmf_asset_relative_url($url);
                        array_push($more[$key], ['url' => $url, 'name' => $value[$nameArr][$k]]);
                    }
                }
            }
        }
        return $more;
    }

    /**
     * 删除车
     * @param $ids  int|array   车id
     * @param int $userId 车所属用户id  [可选]
     * @return bool|int 删除结果  true 成功 false 失败  -1 车不存在
     */
    public function deleteElement($ids, $userId)
    {
        $time   = time();
        $result = false;
        $where  = [];

        if (!empty($userId)) {
            if (is_numeric($ids)) {
                $element = $this->find($ids);
                if (!empty($element)) {
                    if ($this->isUserElement($ids, $userId) || $userId == 1) {
                        $where['id'] = $ids;
                    }
                }
            } else {
                $ids      = $this->strToArr($ids);
                $elements = $this->where('id', 'in', $ids)->select();
                if (!empty($elements)) {
                    $deleteIds = $this->isUserElements($ids, $userId);
                    if (!empty($deleteIds)) {
                        $where['id'] = ['in', $deleteIds];
                    }
                }
            }
        } else {
            if (is_numeric($ids)) {
                $element = $this->find($ids);
                if (!empty($element)) {
                    $where['id'] = $ids;
                }
            } else {
                $ids      = $this->strToArr($ids);
                $elements = $this->where('id', 'in', $ids)->select();
                if (!empty($elements)) {
                    $where['id'] = ['in', $ids];
                }
            }
        }
        if (empty($element) && empty($elements)) {
            return -1;
        }
        if (!empty($where)) {
            $result = $this->useGlobalScope(false)
                ->where($where)
                ->setField('delete_time', $time);
        }
        if ($result) {
            $data = [
                'create_time' => $time,
                'table_name'  => 'car_element'
            ];
            if (!empty($element)) {
                $data['name'] = $element['element_title'];
                $element->recycleBin()->save($data);
            }

            if (!empty($elements)) {
                foreach ($elements as $element) {
                    $data['name'] = $element['element_title'];
                    $element->recycleBin()->save($data);
                }
            }
        }
        return $result;
    }

    /**
     * 判断车所属用户是否为当前用户，超级管理员除外
     * @params  int $id     车id
     * @param   int $userId 当前用户id
     * @return  boolean     是 true , 否 false
     */
    public function isUserElement($id, $userId)
    {
        $elementUserId = $this->useGlobalScope(false)
            ->getFieldById($id, 'user_id');
        if ($elementUserId != $userId || $userId != 1) {
            return false;
        } else {
            return true;
        }
    }

    /**
     * 过滤属于当前用户的车，超级管理员除外
     * @params  array $ids     车id的数组
     * @param   int $userId 当前用户id
     * @return  array     属于当前用户的车id
     */
    public function isUserElements($ids, $userId)
    {
        $elementIds = $this->useGlobalScope(false)
            ->where('user_id', $userId)
            ->where('id', 'in', $ids)
            ->column('id');
        return array_intersect($ids, $elementIds);
    }
}
