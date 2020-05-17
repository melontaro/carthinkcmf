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
use think\db\Query;
use think\Model;
use tree\Tree;

class CarAreaModel extends Model
{

    protected $type = [
        'more' => 'array',
    ];

    /**
     * 生成地区 select树形结构
     * @param int $selectId   需要选中的地区 id
     * @param int $currentAid 需要隐藏的地区 id
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminAreaTree($selectId = 0, $currentAid = 0)
    {
        $areas = $this->order("list_order ASC")
            ->where('delete_time', 0)
            ->where(function (Query $query) use ($currentAid) {
                if (!empty($currentAid)) {
                    $query->where('id', 'neq', $currentAid);
                }
            })
            ->select()->toArray();

        $tree       = new Tree();
        $tree->icon = ['&nbsp;&nbsp;│', '&nbsp;&nbsp;├─', '&nbsp;&nbsp;└─'];
        $tree->nbsp = '&nbsp;&nbsp;';

        $newAreas = [];
        foreach ($areas as $item) {
            $item['selected'] = $selectId == $item['id'] ? "selected" : "";

            array_push($newAreas, $item);
        }

        $tree->init($newAreas);
        $str     = '<option value=\"{$id}\" {$selected}>{$spacer}{$name}</option>';
        $treeStr = $tree->getTree(0, $str);

        return $treeStr;
    }

    /**
     * 地区树形结构
     * @param int    $currentIds
     * @param string $tpl
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function adminAreaTableTree($currentIds = 0, $tpl = '')
    {
//        if (!empty($currentAid)) {
//            $where['id'] = ['neq', $currentAid];
//        }
        $areas = $this->order("list_order ASC")->where('delete_time', 0)->select()->toArray();

        $tree       = new Tree();
        $tree->icon = ['&nbsp;&nbsp;│', '&nbsp;&nbsp;├─', '&nbsp;&nbsp;└─'];
        $tree->nbsp = '&nbsp;&nbsp;';

        if (!is_array($currentIds)) {
            $currentIds = [$currentIds];
        }

        $newAreas = [];
        foreach ($areas as $item) {
            $item['parent_id_node'] = ($item['parent_id']) ? ' class="child-of-node-' . $item['parent_id'] . '"' : '';
            $item['style']          = empty($item['parent_id']) ? '' : 'display:none;';
            $item['status_text']    = empty($item['status']) ? '<span class="label label-warning">隐藏</span>' : '<span class="label label-success">显示</span>';
            $item['checked']        = in_array($item['id'], $currentIds) ? "checked" : "";
            $item['url']            = cmf_url('car/List/index', ['id' => $item['id']]);
            $item['str_action']     = '<a class="btn btn-xs btn-primary" href="' . url("AdminCarArea/add", ["parent" => $item['id']]) . '">添加子地区</a>  <a class="btn btn-xs btn-primary" href="' . url("AdminCarArea/edit", ["id" => $item['id']]) . '">' . lang('EDIT') . '</a>  <a class="btn btn-xs btn-danger js-ajax-delete" href="' . url("AdminCarArea/delete", ["id" => $item['id']]) . '">' . lang('DELETE') . '</a> ';
            if ($item['status']) {
                $item['str_action'] .= '<a class="btn btn-xs btn-warning js-ajax-dialog-btn" data-msg="您确定隐藏此地区吗" href="' . url('AdminCarArea/toggle', ['ids' => $item['id'], 'hide' => 1]) . '">隐藏</a>';
            } else {
                $item['str_action'] .= '<a class="btn btn-xs btn-success js-ajax-dialog-btn" data-msg="您确定显示此地区吗" href="' . url('AdminCarArea/toggle', ['ids' => $item['id'], 'display' => 1]) . '">显示</a>';
            }
            array_push($newAreas, $item);
        }

        $tree->init($newAreas);

        if (empty($tpl)) {
            $tpl = " <tr id='node-\$id' \$parent_id_node style='\$style' data-parent_id='\$parent_id' data-id='\$id'>
                        <td style='padding-left:20px;'><input type='checkbox' class='js-check' data-yid='js-check-y' data-xid='js-check-x' name='ids[]' value='\$id' data-parent_id='\$parent_id' data-id='\$id'></td>
                        <td><input name='list_orders[\$id]' type='text' size='3' value='\$list_order' class='input-order'></td>
                        <td>\$id</td>
                        <td>\$spacer <a href='\$url' target='_blank'>\$name</a></td>
                        <td>\$description</td>
                        <td>\$status_text</td>
                        <td>\$str_action</td>
                    </tr>";
        }
        $treeStr = $tree->getTree(0, $tpl);

        return $treeStr;
    }

    /**
     * 添加车地区
     * @param $data
     * @return bool
     */
    public function addArea($data)
    {
        $result = true;
        self::startTrans();
        try {
            if (!empty($data['more']['thumbnail'])) {
                $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
            }
            $this->allowField(true)->save($data);
            $id = $this->id;
            if (empty($data['parent_id'])) {

                $this->where('id', $id)->update(['path' => '0-' . $id]);
            } else {
                $parentPath = $this->where('id', intval($data['parent_id']))->value('path');
                $this->where('id', $id)->update(['path' => "$parentPath-$id"]);

            }
            self::commit();
        } catch (\Exception $e) {
            self::rollback();
            $result = false;
        }

        if ($result != false) {
            //设置别名
            $routeModel = new RouteModel();
            if (!empty($data['alias']) && !empty($id)) {
                $routeModel->setRoute($data['alias'], 'car/List/index', ['id' => $id], 2, 5000);
                $routeModel->setRoute($data['alias'] . '/:id', 'car/Element/index', ['cid' => $id], 2, 4999);
            }
            $routeModel->getRoutes(true);
        }

        return $result;
    }

    public function editArea($data)
    {
        $result = true;

        $id          = intval($data['id']);
        $parentId    = intval($data['parent_id']);
        $oldArea = $this->where('id', $id)->find();

        if (empty($parentId)) {
            $newPath = '0-' . $id;
        } else {
            $parentPath = $this->where('id', intval($data['parent_id']))->value('path');
            if ($parentPath === false) {
                $newPath = false;
            } else {
                $newPath = "$parentPath-$id";
            }
        }

        if (empty($oldArea) || empty($newPath)) {
            $result = false;
        } else {

            $data['path'] = $newPath;
            if (!empty($data['more']['thumbnail'])) {
                $data['more']['thumbnail'] = cmf_asset_relative_url($data['more']['thumbnail']);
            }
            $this->isUpdate(true)->allowField(true)->save($data, ['id' => $id]);

            $children = $this->field('id,path')->where('path', 'like', $oldArea['path'] . "-%")->select();
            if (!$children->isEmpty()) {
                foreach ($children as $child) {
                    $childPath = str_replace($oldArea['path'] . '-', $newPath . '-', $child['path']);
                    $this->where('id', $child['id'])->update(['path' => $childPath], ['id' => $child['id']]);
                }
            }

            $routeModel = new RouteModel();
            if (!empty($data['alias'])) {
                $routeModel->setRoute($data['alias'], 'car/List/index', ['id' => $data['id']], 2, 5000);
                $routeModel->setRoute($data['alias'] . '/:id', 'car/Element/index', ['cid' => $data['id']], 2, 4999);
            } else {
                $routeModel->deleteRoute('car/List/index', ['id' => $data['id']]);
                $routeModel->deleteRoute('car/Element/index', ['cid' => $data['id']]);
            }

            $routeModel->getRoutes(true);
        }


        return $result;
    }


}