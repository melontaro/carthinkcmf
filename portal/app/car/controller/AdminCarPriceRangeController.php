<?php


namespace app\car\controller;
use app\car\model\CarPriceRangeModel;
use cmf\controller\AdminBaseController;

/**
 * Class AdminAttributeController
 * @package app\car\controller
 * @adminMenuRoot(
 *     'name'   =>'价格范围设置',
 *     'action' =>'index',
 *     'parent' =>'car/AdminAttribute/default',
 *     'display'=> true,
 *     'order'  => 30,
 *     'icon'   =>'th',
 *     'remark' =>'价格范围设置'
 * )
 */
class AdminCarPriceRangeController extends AdminBaseController
{
    public  function  index(){
        $content = hook_one('car_admin_tag_index_view');

        if (!empty($content)) {
            return $content;
        }

        $priceRangeModel = new CarPriceRangeModel();
        $ageRanges           = $priceRangeModel->paginate();

        $this->assign("arrStatus", $priceRangeModel::$STATUS);
        $this->assign("ageRanges", $ageRanges);
        $this->assign('page', $ageRanges->render());
        return $this->fetch();
    }
    /**
     * 添加车价
     * @adminMenu(
     *     'name'   => '添加车价',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车价',
     *     'param'  => ''
     * )
     */
    public function add()
    {
        $carPriceRangeModel = new CarPriceRangeModel();
        $this->assign("arrStatus", $carPriceRangeModel::$STATUS);
        return $this->fetch();
    }

    /**
     * 添加车价提交
     * @adminMenu(
     *     'name'   => '添加车价提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '添加车价提交',
     *     'param'  => ''
     * )
     */
    public function addPost()
    {

        $arrData = $this->request->param();

        $priceRangeModel = new CarPriceRangeModel();
        $priceRangeModel->isUpdate(false)->allowField(true)->save($arrData);

        $this->success(lang("SAVE_SUCCESS"));

    }
    /**
     * 更新车价状态
     * @adminMenu(
     *     'name'   => '更新车价状态',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '更新车价状态',
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

        $priceRangeModel = new CarPriceRangeModel();
        $priceRangeModel->isUpdate(true)->save(["status" => $intStatus], ["id" => $intId]);

        $this->success(lang("SAVE_SUCCESS"));

    }

    /**
     * 删除车价
     * @adminMenu(
     *     'name'   => '删除车价',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '删除车价',
     *     'param'  => ''
     * )
     */
    public function delete()
    {
        $intId = $this->request->param("id", 0, 'intval');

        if (empty($intId)) {
            $this->error(lang("NO_ID"));
        }
        $priceRangeModel = new CarPriceRangeModel();

        $priceRangeModel->where('id' , $intId)->delete();
        // Db::name('car_tag_element')->where('tag_id', $intId)->delete();
        $this->success(lang("DELETE_SUCCESS"));
    }
    /**
     * 车价格选择对话框
     * @adminMenu(
     *     'name'   => '车价格选择对话框',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车价格选择对话框',
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
        $priceRangeModel = new CarPriceRangeModel();
        $priceRanges = $priceRangeModel->select();

        $this->assign('priceRanges', $priceRanges);
        $this->assign('selectedIds', $selectedIds);
        //$this->assign('ages_tree', $agesTree);
        return $this->fetch();
    }
    /**
     * 车价格排序
     * @adminMenu(
     *     'name'   => '车价格排序',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '车价格排序',
     *     'param'  => ''
     * )
     */
    public function listOrder()
    {
        parent::listOrders(Db::name('car_price_range'));
        $this->success("排序更新成功！", '');
    }
    
}