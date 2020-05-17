<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: pl125 <xskjs888@163.com>
// +----------------------------------------------------------------------

namespace api\car\model;

use think\Model;

class CarBrandModel extends Model
{
    //类型转换
    protected $type = [
        'more' => 'array',
    ];


    //模型关联方法
    protected $relationFilter = ['elements'];


    /**
     * more 自动转化
     * @param $value
     * @return array
     */
    public function getMoreAttr($value)
    {
        $more = json_decode($value, true);
        if (!empty($more['thumbnail'])) {
            $more['thumbnail'] = cmf_get_image_url($more['thumbnail']);
        }

        if (!empty($more['photos'])) {
            foreach ($more['photos'] as $key => $value) {
                $more['photos'][$key]['url'] = cmf_get_image_url($value['url']);
            }
        }
        return $more;
    }

    /**
     * 关联车表
     * @return \think\model\relation\BelongsToMany
     */
    public function elements()
    {
        return $this->belongsToMany('CarElementModel', 'car_brand_element', 'element_id', 'brand_id');
    }

    /**
     * 关联车品牌和车表
     * @return \think\model\relation\HasMany
     */
    public function ElementIds()
    {
        return $this->hasMany('CarCategoryElementModel', 'brand_id', 'id');
    }

    /**
     * 此类车id数组
     * @param string $brand_id 品牌di
     * @return array|string|Model|null
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public static function brandElementIds($brand_id)
    {
        $ids      = [];
        $element_ids = self::relation('ElementIds')->field(true)->where('id', $brand_id)->find();
        foreach ($element_ids['ElementIds'] as $key => $id) {
            $ids[] = $id['element_id'];
        }
        $element_ids['ElementIds'] = $ids;
        return $element_ids;
    }
}
