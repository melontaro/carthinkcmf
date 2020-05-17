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

class CarTagElementModel extends Model
{
    /**
     * 获取指定id相关的车id数组
     * @param $element_id  车id
     * @return array    相关的车id
     */
    function getRelationPostIds($element_id)
    {
        $tagIds  = $this->where('element_id', $element_id)
            ->column('tag_id');
        $elementIds = $this->whereIn('tag_id', $tagIds)
            ->column('element_id');
        return array_unique($elementIds);
    }
}