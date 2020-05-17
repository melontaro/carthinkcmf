<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2021 http://www.xamclub.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: TouchAfflatus <axuyin@163.com>
// +----------------------------------------------------------------------
namespace app\car\model;

use app\admin\model\RouteModel;
use think\Model;
use think\Db;

/**
 * @property mixed id
 */
class CarElementModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];

    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    /**
     * 关联 user表
     * @return \think\model\relation\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('UserModel', 'user_id')->setEagerlyType(1);
    }

    /**
     * 关联品牌表
     * @return \think\model\relation\BelongsToMany
     */
    public function brands()
    {
        return $this->belongsToMany('CarBrandModel', 'car_brand_element', 'brand_id', 'element_id');
    }
    /**
     * 关联品牌表
     * @return \think\model\relation\BelongsToMany
     */
    public function areas()
    {
        return $this->belongsToMany('CarAreaModel', 'car_area_element', 'area_id', 'element_id');
    }
    /**
     * 关联标签表
     * @return \think\model\relation\BelongsToMany
     */
    public function tags()
    {
        return $this->belongsToMany('CarTagModel', 'car_tag_element', 'tag_id', 'element_id');
    }
    /**
     * 关联车龄表
     * @return \think\model\relation\BelongsToMany
     */
    public function ages()
    {
        return $this->belongsToMany('CarAgeRangeModel', 'car_age_range_element', 'age_range_id', 'element_id');
    }
    /**
     * 关联颜色表
     * @return \think\model\relation\BelongsToMany
     */
    public function colors()
    {
        return $this->belongsToMany('CarColorModel', 'car_color_element', 'color_id', 'element_id');
    }
    /**
     * 关联国籍表
     * @return \think\model\relation\BelongsToMany
     */
    public function countrys()
    {
        return $this->belongsToMany('CarCountryModel', 'car_country_element', 'country_id', 'element_id');
    }
    /**
     * 关联排量范围表
     * @return \think\model\relation\BelongsToMany
     */
    public function displacementRanges()
    {
        return $this->belongsToMany('CarDisplacementRangeModel', 'car_displacement_range_element', 'displacement_range_id', 'element_id');
    }
    /**
     * 关联排放标准表
     * @return \think\model\relation\BelongsToMany
     */
    public function emissionStandards()
    {
        return $this->belongsToMany('CarEmissionStandardModel', 'car_emission_standard_element', 'emission_standard_id', 'element_id');
    }
    /**
     * 关联能源表
     * @return \think\model\relation\BelongsToMany
     */
    public function energys()
    {
        return $this->belongsToMany('CarEnergyModel', 'car_energy_element', 'energy_id', 'element_id');
    }
    /**
     * 关联发动机表
     * @return \think\model\relation\BelongsToMany
     */
    public function engines()
    {
        return $this->belongsToMany('CarEngineModel', 'car_engine_element', 'engine_id', 'element_id');
    }

    /**
     * 关联变速箱表
     * @return \think\model\relation\BelongsToMany
     */
    public function gearboxs()
    {
        return $this->belongsToMany('CarGearboxModel', 'car_gearbox_element', 'gearbox_id', 'element_id');
    }
    /**
     * 关联车级别表
     * @return \think\model\relation\BelongsToMany
     */
    public function levels()
    {
        return $this->belongsToMany('CarLevelModel', 'car_level_element', 'level_id', 'element_id');
    }
    /**
 * 关联车亮点
 * @return \think\model\relation\BelongsToMany
 */
    public function lightspots()
    {
        return $this->belongsToMany('CarLightspotModel', 'car_lightspot_element', 'lightspot_id', 'element_id');
    }
    /**
     * 关联车里程
     * @return \think\model\relation\BelongsToMany
     */
    public function mileages()
    {
        return $this->belongsToMany('CarMileageModel', 'car_mileage_element', 'mileage_id', 'element_id');
    }
    /**
     * 关联价格范围
     * @return \think\model\relation\BelongsToMany
     */
    public function priceRanges()
    {
        return $this->belongsToMany('CarPriceRangeModel', 'car_price_range_element', 'price_range_id', 'element_id');
    }
    /**
     * 关联生产方式
     * @return \think\model\relation\BelongsToMany
     */
    public function productionTypes()
    {
        return $this->belongsToMany('CarProductionTypeModel', 'car_production_type_element', 'production_type_id', 'element_id');
    }
    /**
     * 关联座位数
     * @return \think\model\relation\BelongsToMany
     */
    public function seats()
    {
        return $this->belongsToMany('CarSeatModel', 'car_seat_element', 'seat_id', 'element_id');
    }
    /**
     * element_content 自动转化
     * @param $value
     * @return string
     */
    public function getElementContentAttr($value)
    {
        return cmf_replace_content_file_url(htmlspecialchars_decode($value));
    }

    /**
     * element_content 自动转化
     * @param $value
     * @return string
     */
    public function setElementContentAttr($value)
    {
        return htmlspecialchars(cmf_replace_content_file_url(htmlspecialchars_decode($value), true));
    }

    /**
     * published_time 自动完成
     * @param $value
     * @return false|int
     */
    public function setPublishedTimeAttr($value)
    {
        return strtotime($value);
    }

    /**
     * 后台管理添加车
     * @param array        $data       车数据
     * @param array|string $brands 车品牌 id
     * @return $this
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function adminAddElement($data, $brands)
    {
        $data['user_id'] = cmf_get_current_admin_id();

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
            $data['thumbnail']         = $data['more']['thumbnail'];
        }

        if (!empty($data['more']['audio'])) {
            $data['more']['audio'] = cmf_asset_relative_url($data['more']['audio']);
        }

        if (!empty($data['more']['video'])) {
            $data['more']['video'] = cmf_asset_relative_url($data['more']['video']);
        }

        $this->allowField(true)->data($data, true)->isUpdate(false)->save();

        if (is_string($brands)) {
            $brands = explode(',', $brands);
        }
        $areas= $data['areas'];
        if (is_string($areas)) {
            $areas = explode(',', $areas);//将字符串打散为数组
        }
        $this->brands()->save($brands);
        $this->ages()->save($data['ages']);
        $this->colors()->save($data['colors']);
        $this->countrys()->save($data['countrys']);
        $this->displacementRanges()->save($data['displacementRanges']);
        $this->emissionStandards()->save($data['emissionStandards']);
        $this->energys()->save($data['energys']);
        $this->engines()->save($data['engines']);
        $this->gearboxs()->save($data['gearboxs']);
        $this->levels()->save($data['levels']);
        $this->lightspots()->save($data['lightspots']);
        $this->mileages()->save($data['mileages']);
        $this->priceRanges()->save($data['priceRanges']);
        $this->productionTypes()->save($data['productionTypes']);
        $this->seats()->save($data['seats']);
        $this->areas()->save($areas);



        $data['element_keywords'] = str_replace('，', ',', $data['element_keywords']);

        $keywords = explode(',', $data['element_keywords']);

        $this->addTags($keywords, $this->id);

        return $this;

    }

    /**
     * 后台管理编辑车
     * @param array        $data       车数据
     * @param array|string $brands 车品牌 id
     * @return $this
     * @throws \think\Exception
     */
    public function adminEditElement($data, $brands)
    {

        unset($data['user_id']);

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
            $data['thumbnail']         = $data['more']['thumbnail'];
        }

        if (!empty($data['more']['audio'])) {
            $data['more']['audio'] = cmf_asset_relative_url($data['more']['audio']);
        }

        if (!empty($data['more']['video'])) {
            $data['more']['video'] = cmf_asset_relative_url($data['more']['video']);
        }

        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        if (is_string($brands)) {
            $brands = explode(',', $brands);
        }

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


        $data['element_keywords'] = str_replace('，', ',', $data['element_keywords']);

        $keywords = explode(',', $data['element_keywords']);

        $this->addTags($keywords, $data['id']);

        return $this;

    }

    /**
     * 增加标签
     * @param $keywords
     * @param $elementId
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function addTags($keywords, $elementId)
    {
        $carTagModel = new CarTagModel();

        $tagIds = [];

        $data = [];

        if (!empty($keywords)) {

            $oldTagIds = Db::name('car_tag_element')->where('element_id', $elementId)->column('tag_id');

            foreach ($keywords as $keyword) {
                $keyword = trim($keyword);
                if (!empty($keyword)) {
                    $findTag = $carTagModel->where('name', $keyword)->find();
                    if (empty($findTag)) {
                        $tagId = $carTagModel->insertGetId([
                            'name' => $keyword
                        ]);
                    } else {
                        $tagId = $findTag['id'];
                    }

                    if (!in_array($tagId, $oldTagIds)) {
                        array_push($data, ['tag_id' => $tagId, 'element_id' => $elementId]);
                    }

                    array_push($tagIds, $tagId);

                }
            }


            if (empty($tagIds) && !empty($oldTagIds)) {
                Db::name('car_tag_element')->where('element_id', $elementId)->delete();
            }

            $sameTagIds = array_intersect($oldTagIds, $tagIds);

            $shouldDeleteTagIds = array_diff($oldTagIds, $sameTagIds);

            if (!empty($shouldDeleteTagIds)) {
                Db::name('car_tag_element')
                    ->where('element_id', $elementId)
                    ->where('tag_id', 'in', $shouldDeleteTagIds)
                    ->delete();
            }

            if (!empty($data)) {
                Db::name('car_tag_element')->insertAll($data);
            }


        } else {
            Db::name('car_tag_element')->where('element_id', $elementId)->delete();
        }
    }

    /**
     * @param $data
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminDeletePage($data)
    {

        if (isset($data['id'])) {
            $id = $data['id']; //获取删除id

            $res = $this->where('id', $id)->find();

            if ($res) {
                $res = json_decode(json_encode($res), true); //转换为数组

                $recycleData = [
                    'object_id'   => $res['id'],
                    'create_time' => time(),
                    'table_name'  => 'car_element#page',
                    'name'        => $res['element_title'],

                ];

                Db::startTrans(); //开启事务
                $transStatus = false;
                try {
                    Db::name('car_element')->where('id', $id)->update([
                        'delete_time' => time()
                    ]);
                    Db::name('recycle_bin')->insert($recycleData);

                    $transStatus = true;
                    // 提交事务
                    Db::commit();
                } catch (\Exception $e) {

                    // 回滚事务
                    Db::rollback();
                }
                return $transStatus;


            } else {
                return false;
            }
        } elseif (isset($data['ids'])) {
            $ids = $data['ids'];

            $res = $this->where('id', 'in', $ids)
                ->select();

            if ($res) {
                $res = json_decode(json_encode($res), true);
                foreach ($res as $key => $value) {
                    $recycleData[$key]['object_id']   = $value['id'];
                    $recycleData[$key]['create_time'] = time();
                    $recycleData[$key]['table_name']  = 'car_element';
                    $recycleData[$key]['name']        = $value['element_title'];

                }

                Db::startTrans(); //开启事务
                $transStatus = false;
                try {
                    Db::name('car_element')->where('id', 'in', $ids)
                        ->update([
                            'delete_time' => time()
                        ]);


                    Db::name('recycle_bin')->insertAll($recycleData);

                    $transStatus = true;
                    // 提交事务
                    Db::commit();

                } catch (\Exception $e) {

                    // 回滚事务
                    Db::rollback();


                }
                return $transStatus;


            } else {
                return false;
            }

        } else {
            return false;
        }
    }

    /**
     * 后台管理添加页面
     * @param array $data 页面数据
     * @return $this
     */
    public function adminAddPage($data)
    {
        $data['user_id'] = cmf_get_current_admin_id();

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $data['element_status'] = empty($data['element_status']) ? 0 : 1;
        $data['element_type']   = 2;
        $this->allowField(true)->data($data, true)->save();

        return $this;

    }

    /**
     * 后台管理编辑页面
     * @param array $data 页面数据
     * @return $this
     */
    public function adminEditPage($data)
    {
        $data['user_id'] = cmf_get_current_admin_id();

        if (!empty($data['more']['thumbnail'])) {
            $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
        }

        $data['element_status'] = empty($data['element_status']) ? 0 : 1;
        $data['element_type']   = 2;
        $this->allowField(true)->isUpdate(true)->data($data, true)->save();

        $routeModel = new RouteModel();
        $routeModel->setRoute($data['element_alias'], 'car/Page/index', ['id' => $data['id']], 2, 5000);

        $routeModel->getRoutes(true);
        return $this;
    }

}
