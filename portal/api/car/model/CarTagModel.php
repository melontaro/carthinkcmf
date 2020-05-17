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

class CarTagModel extends Model
{

    /**
     * 关联 车表
     * @return \think\model\relation\BelongsToMany
     */
    public function elements()
    {
        return $this->belongsToMany('CarElementModel','car_tag_element','element_id','tag_id')->alias('element');
    }
}
