<?php


namespace app\car\controller;

use app\car\model\CarAgeRangeModel;
use cmf\controller\AdminBaseController;
use think\Console;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'车龄范围设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 30,
 *     'icon'   =>'age',
 *     'remark' =>'车龄范围设置'
 * )
 */
class AdminCarAgeRangeController extends AdminBaseController
{
        public  function  index(){
            $content = hook_one('car_admin_tag_index_view');

            if (!empty($content)) {
                return $content;
            }
            $carAgeRangeModel = new CarAgeRangeModel();
            $ageRanges           = $carAgeRangeModel->paginate();

            $this->assign("arrStatus", $carAgeRangeModel::$STATUS);
            $this->assign("ageRanges", $ageRanges);
            $this->assign('page', $ageRanges->render());
            return $this->fetch();
        }
    /**
     * 添加车标签
     * @adminMenu(
     *     'name'   => '添加车标签',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车标签',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $carAgeRangeModel = new CarAgeRangeModel();
        $this->assign("arrStatus", $carAgeRangeModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加车龄提交
     * @adminMenu(
     *     'name'   => '添加车龄提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车龄提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {
        $arrData = $this->request->param();

        $carAgeRangeModel = new CarAgeRangeModel();
        $carAgeRangeModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新车龄状态
     * @adminMenu(
     *     'name'   => '更新车龄状态',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新车龄状态',
     *     'param'  => ''
     * )
     */
    public function upStatus()
    {
        $intId     = $this->request->param("id");
        $intStatus = $this->request->param("status");
        $intStatus = $intStatus ? 1 : 0;
        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }

        $carAgeRangeModel = new CarAgeRangeModel();
        $carAgeRangeModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除车龄
     * @adminMenu(
     *     'name'   => '删除车龄',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车龄',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $carAgeRangeModel = new CarAgeRangeModel();

        $carAgeRangeModel->where('id' , $intId)->delete();
       // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }

    /**
     * 车龄选择对话框
     * @adminMenu(
     *     'name'   => '车龄选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车龄选择对话框',
     *     'param'  => ''
     * )
     * @return mixed
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function select()
    {
        $ids                 = $this->request->param('ids');
       $selectedIds         = explode(',', $ids);
        $carAgeRangeModel = new CarAgeRangeModel();

        $tpl = <<<tpl
<tr class='data-item-tr'>
    <td>
        <input type='checkbox' class='js-check' data-yid='js-check-y' data-xid='js-check-x' name='ids[]'
               value='\$id' data-name='\$name' \$checked>
    </td>
    <td>\$id</td>
    <td>\$spacer <a href='\$url' target='_blank'>\$min_age</a></td>
</tr>
tpl;

       // $agesTree = $carAgeRangeModel->adminAgeTableTree($selectedIds, $tpl);

        $ageRanges = $carAgeRangeModel->select();

        $this->assign('ages', $ageRanges);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车龄范围排序
     * @adminMenu(
     *     'name'   => '车龄范围排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车龄范围排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_age_range'));
        $this->success("排序更新成功！", '');
    }
}