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
class CarEmissionStandardModel extends Model
{
    public static $STATUS = array(
        0 => "未启用",
        1 => "已启用",
    );

}
