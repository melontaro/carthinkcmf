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
namespace app\car\service;

use app\car\model\CarElementModel;
use app\car\model\CarBrandModel;
use think\Db;
use think\db\Query;

class ApiService
{
    /**
     * 功能:查询车列表,支持分页;<br>
     * 注:此方法查询时关联两个表car_brand_element(brand_element),car_element(element);在指定排序(order),指定查询条件(where)最好指定一下表别名
     * @param array $param 查询参数<pre>
     *                     array(
     *                     'brand_ids'=>'',
     *                     'where'=>'',
     *                     'limit'=>'',
     *                     'order'=>'',
     *                     'page'=>'',
     *                     'relation'=>''
     *                     )
     *                     字段说明:
     *                     brand_ids:车所在品牌,可指定一个或多个品牌id,以英文逗号分隔,如1或1,2,3 默认值为全部
     *                     field:调用指定的字段@todo
     *                     如只调用elements表里的id和element_title字段可以是element.id,element.element_title; 默认全部,
     *                     此方法查询时关联两个表car_brand_element(brand_element),car_element(element);
     *                     所以最好指定一下表名,以防字段冲突
     *                     limit:数据条数,默认值为10,可以指定从第几条开始,如3,8(表示共调用8条,从第3条开始)
     *                     order:排序方式,如按elements表里的published_time字段倒序排列：element.published_time desc
     *                     where:查询条件,字符串形式,和sql语句一样,请在事先做好安全过滤,最好使用第二个参数$where的数组形式进行过滤,此方法查询时关联多个表,所以最好指定一下表名,以防字段冲突,查询条件(只支持数组),格式和thinkPHP的where方法一样,此方法查询时关联多个表,所以最好指定一下表名,以防字段冲突;
     *                     </pre>
     * @return array 包括分页的车列表<pre>
     *                     格式:
     *                     array(
     *                     "elements"=>array(),//车列表,array
     *                     "page"=>"",//生成的分页html,不分页则没有此项
     *                     "total"=>100, //符合条件的车总数,不分页则没有此项
     *                     "total_pages"=>5 // 总页数,不分页则没有此项
     *                     )</pre>
     */
    public static function elements($param)
    {
        $carElementModel = new CarElementModel();

        $where = [
            'element.element_status' => 1,
            'element.element_type'   => 1,
            'element.delete_time' => 0
        ];

        $paramWhere = empty($param['where']) ? '' : $param['where'];

        $limit       = empty($param['limit']) ? 10 : $param['limit'];
        $order       = empty($param['order']) ? '' : $param['order'];
        $page        = isset($param['page']) ? $param['page'] : false;
        $relation    = empty($param['relation']) ? '' : $param['relation'];
        $brandIds = empty($param['brand_ids']) ? '' : $param['brand_ids'];

        $join = [
            //['__USER__ user', 'element.user_id = user.id'],
        ];

        $whereBrandId = null;

        if (!empty($brandIds)) {

            $field = !empty($param['field']) ? $param['field'] : 'element.*,min(brand_element.brand_id) as brand_id';
            array_push($join, ['__CAR_BRAND_ELEMENT__ brand_element', 'element.id = brand_element.element_id']);

            if (!is_array($brandIds)) {
                $brandIds = explode(',', $brandIds);
            }

            if (count($brandIds) == 1) {
                $whereBrandId = function (Query $query) use ($brandIds) {
                    $query->where('brand_element.brand_id', $brandIds[0]);
                };
            } else {
                $whereBrandId = function (Query $query) use ($brandIds) {
                    $query->where('brand_element.brand_id', 'in', $brandIds);
                };
            }
        } else {

            $field = !empty($param['field']) ? $param['field'] : 'element.*,min(brand_element.brand_id) as brand_id';
            array_push($join, ['__CAR_BRAND_ELEMENT__ brand_element', 'element.id = brand_element.element_id']);
        }

        $elements = $carElementModel->alias('element')->field($field)
            ->join($join)
            ->where($where)
            ->where($paramWhere)
            ->where($whereBrandId)
            ->where('element.published_time', ['> time', 0], ['<', time()], 'and')
            ->order($order)
            ->group('element.id');

        $return = [];

        if (empty($page)) {
            $elements = $elements->limit($limit)->select();

            if (!empty($relation) && !empty($elements['items'])) {
                $elements->load($relation);
            }

            $return['elements'] = $elements;
        } else {

            if (is_array($page)) {
                if (empty($page['list_rows'])) {
                    $page['list_rows'] = 10;
                }

                $elements = $elements->paginate($page);
            } else {
                $elements = $elements->paginate(intval($page));
            }

            if (!empty($relation) && !empty($elements['items'])) {
                $elements->load($relation);
            }

            $elements->appends(request()->get());
            $elements->appends(request()->post());

            $return['elements']    = $elements->items();
            $return['page']        = $elements->render();
            $return['total']       = $elements->total();
            $return['total_pages'] = $elements->lastPage();
        }


        return $return;

    }

    /**
     * 功能:查询标签车列表,支持分页;<br>
     * 注:此方法查询时关联两个表car_tag_element(tag_element),car_element(element);在指定排序(order),指定查询条件(where)最好指定一下表别名
     * @param array $param 查询参数<pre>
     *                     array(
     *                     'tag_id'=>'',
     *                     'where'=>'',
     *                     'limit'=>'',
     *                     'order'=>'',
     *                     'page'=>'',
     *                     'relation'=>''
     *                     )
     *                     字段说明:
     *                     field:调用指定的字段@todo
     *                     如只调用elements表里的id和element_title字段可以是element.id,element.element_title; 默认全部,
     *                     此方法查询时关联两个表car_tag_element(brand_element),car_element(element);
     *                     所以最好指定一下表名,以防字段冲突
     *                     limit:数据条数,默认值为10,可以指定从第几条开始,如3,8(表示共调用8条,从第3条开始)
     *                     order:排序方式,如按elements表里的published_time字段倒序排列：element.published_time desc
     *                     where:查询条件,字符串形式,和sql语句一样,请在事先做好安全过滤,最好使用第二个参数$where的数组形式进行过滤,此方法查询时关联多个表,所以最好指定一下表名,以防字段冲突,查询条件(只支持数组),格式和thinkPHP的where方法一样,此方法查询时关联多个表,所以最好指定一下表名,以防字段冲突;
     *                     </pre>
     * @return array 包括分页的车列表<pre>
     *                     格式:
     *                     array(
     *                     "elements"=>array(),//车列表,array
     *                     "page"=>"",//生成的分页html,不分页则没有此项
     *                     "total"=>100, //符合条件的车总数,不分页则没有此项
     *                     "total_pages"=>5 // 总页数,不分页则没有此项
     *                     )</pre>
     */
    public static function tagElements($param)
    {
        $carElementModel = new CarElementModel();

        $where = [
            'element.element_status' => 1,
            'element.element_type'   => 1,
            'element.delete_time' => 0
        ];

        $paramWhere = empty($param['where']) ? '' : $param['where'];

        $limit    = empty($param['limit']) ? 10 : $param['limit'];
        $order    = empty($param['order']) ? '' : $param['order'];
        $page     = isset($param['page']) ? $param['page'] : false;
        $relation = empty($param['relation']) ? '' : $param['relation'];
        $tagId    = empty($param['tag_id']) ? '' : $param['tag_id'];

        $join = [
            //['__USER__ user', 'element.user_id = user.id'],
        ];

        if (empty($tagId)) {
            return null;

        } else {
            $field = !empty($param['field']) ? $param['field'] : 'element.*';
            array_push($join, ['__CAR_TAG_POST__ tag_element', 'element.id = tag_element.element_id']);

            $where['tag_element.tag_id'] = $tagId;
        }

        $elements = $carElementModel->alias('element')->field($field)
            ->join($join)
            ->where($where)
            ->where($paramWhere)
            ->where('element.published_time', ['> time', 0], ['<', time()], 'and')
            ->order($order);

        $return = [];

        if (empty($page)) {
            $elements = $elements->limit($limit)->select();

            if (!empty($relation) && !empty($elements['items'])) {
                $elements->load($relation);
            }

            $return['elements'] = $elements;
        } else {

            if (is_array($page)) {
                if (empty($page['list_rows'])) {
                    $page['list_rows'] = 10;
                }

                $elements = $elements->paginate($page);
            } else {
                $elements = $elements->paginate(intval($page));
            }

            if (!empty($relation) && !empty($elements->items())) {
                $elements->load($relation);
            }

            $elements->appends(request()->get());
            $elements->appends(request()->element());

            $return['elements']    = $elements->items();
            $return['page']        = $elements->render();
            $return['total']       = $elements->total();
            $return['total_pages'] = $elements->lastPage();
        }

        return $return;
    }

    /**
     * 获取指定id的车
     * @param int $id
     * @return array|false|\PDOStatement|string|\think\Model
     */
    public static function element($id)
    {
        $carElementModel = new CarElementModel();

        $where = [
            'element_status' => 1,
            'element_type'   => 1,
            'id'          => $id,
            'delete_time' => 0
        ];

        return $carElementModel->where($where)
            ->where('published_time', ['> time', 0], ['<', time()], 'and')
            ->find();
    }

    /**
     * 获取指定条件的页面列表
     * @param array $param 查询参数<pre>
     *                     array(
     *                     'where'=>'',
     *                     'order'=>'',
     *                     )</pre>
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function pages($param)
    {
        $paramWhere = empty($param['where']) ? '' : $param['where'];

        $order = empty($param['order']) ? '' : $param['order'];

        $carElementModel = new CarElementModel();

        $where = [
            'element_status' => 1,
            'element_type'   => 2, //页面
            'delete_time' => 0
        ];

        return $carElementModel
            ->where($where)
            ->where($paramWhere)
            ->where('published_time', [['> time', 0], ['<', time()]], 'and')
            ->order($order)
            ->select();
    }

    /**
     * 获取指定id的页面
     * @param int $id 页面的id
     * @return array|false|\PDOStatement|string|\think\Model 返回符合条件的页面
     */
    public static function page($id)
    {
        $carElementModel = new CarElementModel();

        $where = [
            'element_status' => 1,
            'element_type'   => 2,
            'id'          => $id,
            'delete_time' => 0
        ];

        return $carElementModel->where($where)
            ->where('published_time', ['> time', 0], ['<', time()], 'and')
            ->find();
    }

    /**
     * 返回指定品牌
     * @param int $id 品牌id
     * @return array 返回符合条件的品牌
     */
    public static function brand($id)
    {
        $carBrandModel = new CarBrandModel();

        $where = [
            'status'      => 1,
            'delete_time' => 0,
            'id'          => $id
        ];

        return $carBrandModel->where($where)->find();
    }

    /**
     * 返回指定品牌下的子品牌
     * @param int $brandId 品牌id
     * @param     $field      string  指定查询字段
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @return false|\PDOStatement|string|\think\Collection 返回指定品牌下的子品牌
     */
    public static function subCategories($brandId, $field = '*')
    {
        $carBrandModel = new CarBrandModel();

        $where = [
            'status'      => 1,
            'delete_time' => 0,
            'parent_id'   => $brandId
        ];

		return $carBrandModel->field($field)->where($where)->order('list_order ASC')->select();
	}

    /**
     * 返回指定品牌下的所有子品牌
     * @param int $brandId 品牌id
     * @return array 返回指定品牌下的所有子品牌
     */
    public static function allSubCategories($brandId)
    {
        $carBrandModel = new CarBrandModel();

        $brandId = intval($brandId);

        if ($brandId !== 0) {
            $brand = $carBrandModel->field('path')->where('id', $brandId)->find();

            if (empty($brand)) {
                return [];
            }

            $brandPath = $brand['path'];
        } else {
            $brandPath = 0;
        }

        $where = [
            'status'      => 1,
            'delete_time' => 0
        ];

        return $carBrandModel->where($where)->whereLike('path', "$brandPath-%")->select();
    }

    /**
     * 返回符合条件的所有品牌
     * @param array $param 查询参数<pre>
     *                     array(
     *                     'where'=>'',
     *                     'order'=>'',
     *                     )</pre>
     * @return false|\PDOStatement|string|\think\Collection
     */
    public static function categories($param)
    {
        $paramWhere = empty($param['where']) ? '' : $param['where'];

        $order = empty($param['order']) ? '' : $param['order'];

        $carBrandModel = new CarBrandModel();

        $where = [
            'status'      => 1,
            'delete_time' => 0,
        ];

        $temp = $carBrandModel
            ->where($where)
            ->where($paramWhere)
            ->order($order);

        if (!empty($param['ids'])) {
            $temp->whereIn('id', $param['ids']);
        }
        return $temp->select();
    }

    /**
     * 获取面包屑数据
     * @param int     $brandId  当前车所在品牌,或者当前品牌的id
     * @param boolean $withCurrent 是否获取当前品牌
     * @return array 面包屑数据
     */
    public static function breadcrumb($brandId, $withCurrent = false)
    {
        $data                = [];
        $carBrandModel = new CarBrandModel();

        $path = $carBrandModel->where(['id' => $brandId])->value('path');

        if (!empty($path)) {
            $parents = explode('-', $path);
            if (!$withCurrent) {
                array_pop($parents);
            }

            if (!empty($parents)) {
                $data = $carBrandModel->where('id', 'in', $parents)->order('path ASC')->select();
            }
        }

        return $data;
    }

}