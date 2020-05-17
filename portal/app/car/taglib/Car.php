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
namespace app\car\taglib;

use think\template\TagLib;

class Car extends TagLib
{
    /**
     * 定义标签列表
     */
    protected $tags = [
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'elements'         => ['attr' => 'field,where,limit,order,page,relation,returnVarName,pageVarName,brandIds', 'close' => 1],//非必须属性item
        'tagelements'      => ['attr' => 'field,where,limit,order,page,relation,returnVarName,pageVarName,tagId', 'close' => 1],//非必须属性item
        'page'             => ['attr' => 'id', 'close' => 1],//非必须属性item
        'breadcrumb'       => ['attr' => 'cid', 'close' => 1],//非必须属性self
        'categories'       => ['attr' => 'ids,where,order', 'close' => 1],//非必须属性item
        'brand'         => ['attr' => 'id', 'close' => 1],//非必须属性item
        'subcategories'    => ['attr' => 'brandId', 'close' => 1],//非必须属性item
        'allsubcategories' => ['attr' => 'brandId', 'close' => 1],//非必须属性item
    ];

    /**
     * 车列表标签
     */
    public function tagElements($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $order         = empty($tag['order']) ? 'element.published_time DESC' : $tag['order'];
        $relation      = empty($tag['relation']) ? '' : $tag['relation'];
        $pageVarName   = empty($tag['pageVarName']) ? '__PAGE_VAR_NAME__' : $tag['pageVarName'];
        $returnVarName = empty($tag['returnVarName']) ? 'elements_data' : $tag['returnVarName'];

        $field = "''";
        if (!empty($tag['field'])) {
            if (strpos($tag['field'], '$') === 0) {
                $field = $tag['field'];
                $this->autoBuildVar($field);
            } else {
                $field = "'{$tag['field']}'";
            }
        }

        $where = '""';
        if (!empty($tag['where']) && strpos($tag['where'], '$') === 0) {
            $where = $tag['where'];
        }

        $limit = "''";
        if (!empty($tag['limit'])) {
            if (strpos($tag['limit'], '$') === 0) {
                $limit = $tag['limit'];
                $this->autoBuildVar($limit);
            } else {
                $limit = "'{$tag['limit']}'";
            }
        }

        $page = "''";
        if (!empty($tag['page'])) {
            if (strpos($tag['page'], '$') === 0) {
                $page = $tag['page'];
                $this->autoBuildVar($page);
            } else {
                $page = intval($tag['page']);
                $page = "'{$page}'";
            }
        }

        $brandIds = "''";
        if (!empty($tag['brandIds'])) {
            if (strpos($tag['brandIds'], '$') === 0) {
                $brandIds = $tag['brandIds'];
                $this->autoBuildVar($brandIds);
            } else {
                $brandIds = "'{$tag['brandIds']}'";
            }
        }

        if (!empty($order) && strpos($order, '$') === 0) {
            $this->autoBuildVar($order);
        } else {
            $order = "'{$order}'";
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\car\service\ApiService::elements([
    'field'   => {$field},
    'where'   => {$where},
    'limit'   => {$limit},
    'order'   => {$order},
    'page'    => {$page},
    'relation'=> '{$relation}',
    'brand_ids'=>{$brandIds}
]);

\${$pageVarName} = isset(\${$returnVarName}['page'])?\${$returnVarName}['page']:'';

 ?>
<volist name="{$returnVarName}.elements" id="{$item}">
{$content}
</volist>
parse;
        return $parse;
    }

    /**
     * 标签车列表标签
     */
    public function tagTagElements($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $order         = empty($tag['order']) ? 'element.published_time DESC' : $tag['order'];
        $relation      = empty($tag['relation']) ? '' : $tag['relation'];
        $pageVarName   = empty($tag['pageVarName']) ? '__PAGE_VAR_NAME__' : $tag['pageVarName'];
        $returnVarName = empty($tag['returnVarName']) ? 'tag_elements_data' : $tag['returnVarName'];

        $field = "''";
        if (!empty($tag['field'])) {
            if (strpos($tag['field'], '$') === 0) {
                $field = $tag['field'];
                $this->autoBuildVar($field);
            } else {
                $field = "'{$tag['field']}'";
            }
        }

        $where = '""';
        if (!empty($tag['where']) && strpos($tag['where'], '$') === 0) {
            $where = $tag['where'];
        }

        $limit = "''";
        if (!empty($tag['limit'])) {
            if (strpos($tag['limit'], '$') === 0) {
                $limit = $tag['limit'];
                $this->autoBuildVar($limit);
            } else {
                $limit = "'{$tag['limit']}'";
            }
        }

        $page = "''";
        if (!empty($tag['page'])) {
            if (strpos($tag['page'], '$') === 0) {
                $page = $tag['page'];
                $this->autoBuildVar($page);
            } else {
                $page = intval($tag['page']);
                $page = "'{$page}'";
            }
        }

        $tagId = "''";
        if (!empty($tag['tagId'])) {
            if (strpos($tag['tagId'], '$') === 0) {
                $tagId = $tag['tagId'];
                $this->autoBuildVar($tagId);
            } else {
                $tagId = "'{$tag['tagId']}'";
            }
        }

        if (strpos($order, '$') === 0) {
            $this->autoBuildVar($order);
        } else {
            $order = "'{$order}'";
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\car\service\ApiService::tagElements([
    'field'   => {$field},
    'where'   => {$where},
    'limit'   => {$limit},
    'order'   => {$order},
    'page'    => {$page},
    'relation'=> '{$relation}',
    'tag_id'=>{$tagId}
]);

\${$pageVarName} = isset(\${$returnVarName}['page'])?\${$returnVarName}['page']:'';

 ?>
<volist name="{$returnVarName}.elements" id="{$item}">
{$content}
</volist>
parse;
        return $parse;
    }

    /**
     * 单页车标签
     */
    public function tagPage($tag, $content)
    {
        $id = empty($tag['id']) ? 0 : $tag['id'];
        if (strpos($id, '$') === 0) {
            $this->autoBuildVar($id);
        }
        $returnVarName = empty($tag['item']) ? 'car_page' : $tag['item'];

        $parse = <<<parse
<?php
\${$returnVarName} = \app\car\service\ApiService::page({$id});
?>
{$content}
parse;
        return $parse;
    }

    /**
     * 面包屑标签
     */
    public function tagBreadcrumb($tag, $content)
    {
        $cid = empty($tag['cid']) ? '0' : $tag['cid'];

        if (!empty($cid)) {
            $this->autoBuildVar($cid);
        }

        $self = isset($tag['self']) ? $tag['self'] : 'false';

        $parse = <<<parse
<?php
if(!empty({$cid})){
    \$__BREADCRUMB_ITEMS__ = \app\car\service\ApiService::breadcrumb({$cid},{$self});
?>

<volist name="__BREADCRUMB_ITEMS__" id="vo">
    {$content}
</volist>

<?php
}
?>
parse;

        return $parse;

    }

    /**
     * 车品牌标签
     */
    public function tagCategories($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $order         = empty($tag['order']) ? '' : $tag['order'];
        $ids           = empty($tag['ids']) ? '""' : $tag['ids'];
        $returnVarName = 'car_categories_data';
        if (strpos($ids, '$') === 0) {
            $this->autoBuildVar($ids);
        }
        $where = '""';
        if (!empty($tag['where']) && strpos($tag['where'], '$') === 0) {
            $where = $tag['where'];
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\car\service\ApiService::categories([
    'where'   => {$where},
    'order'   => '{$order}',
    'ids'     => {$ids}
]);

 ?>
<volist name="{$returnVarName}" id="{$item}">
{$content}
</volist>
parse;
        return $parse;
    }

    /**
     * 车品牌详情标签
     * @param array  $tag
     * @param string $content
     * @return string
     */
    public function tagBrand($tag, $content)
    {
        $id = empty($tag['id']) ? 0 : $tag['id'];
        if (strpos($id, '$') === 0) {
            $this->autoBuildVar($id);
        }
        $returnVarName = empty($tag['item']) ? 'car_brand' : $tag['item'];

        $parse = <<<parse
<?php
\${$returnVarName} = \app\car\service\ApiService::brand({$id});
?>
{$content}
parse;
        return $parse;
    }

    /**
     * 车子品牌标签
     */
    public function tagSubCategories($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $returnVarName = 'car_sub_categories_data';

        $brandId = "0";
        if (!empty($tag['brandId'])) {
            if (strpos($tag['brandId'], '$') === 0) {
                $brandId = $tag['brandId'];
                $this->autoBuildVar($brandId);
            } else {
                $brandId = intval($tag['brandId']);
                $brandId = "{$brandId}";
            }
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\car\service\ApiService::subCategories({$brandId});
 
 ?>
<volist name="{$returnVarName}" id="{$item}">
{$content}
</volist>
parse;
        return $parse;
    }


    /**
     * 车品牌所有子品牌标签
     */
    public function tagAllSubCategories($tag, $content)
    {
        $item          = empty($tag['item']) ? 'vo' : $tag['item'];//循环变量名
        $returnVarName = 'car_all_sub_categories_data';

        $brandId = "0";
        if (!empty($tag['brandId'])) {
            if (strpos($tag['brandId'], '$') === 0) {
                $brandId = $tag['brandId'];
                $this->autoBuildVar($brandId);
            } else {
                $brandId = intval($tag['brandId']);
                $brandId = "{$brandId}";
            }
        }

        $parse = <<<parse
<?php
\${$returnVarName} = \app\car\service\ApiService::allSubCategories({$brandId});
 ?>
<volist name="{$returnVarName}" id="{$item}">
{$content}
</volist>
parse;
        return $parse;
    }

}