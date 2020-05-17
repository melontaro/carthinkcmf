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
return [
    'car_before_assign_element'    => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车显示之前', // 钩子名称
        "description" => "车显示之前", //钩子描述
        "once"        => 0 // 是否只执行一次
    ],
    'car_admin_after_save_element' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '后台车保存之后', // 钩子名称
        "description" => "后台车保存之后", //钩子描述
        "once"        => 0 // 是否只执行一次
    ],
    'car_admin_element_index_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车管理列表界面', // 钩子名称
        "description" => "车辆后台车管理列表界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_element_add_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车添加界面', // 钩子名称
        "description" => "车辆后台车添加界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_element_edit_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车编辑界面', // 钩子名称
        "description" => "车辆后台车编辑界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_brand_index_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车品牌管理列表界面', // 钩子名称
        "description" => "车辆后台车品牌管理列表界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_brand_add_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车品牌添加界面', // 钩子名称
        "description" => "车辆后台车品牌添加界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_brand_edit_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车品牌编辑界面', // 钩子名称
        "description" => "车辆后台车品牌编辑界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_page_index_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台页面管理列表界面', // 钩子名称
        "description" => "车辆后台页面管理列表界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_page_add_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台页面添加界面', // 钩子名称
        "description" => "车辆后台页面添加界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_page_edit_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台页面编辑界面', // 钩子名称
        "description" => "车辆后台页面编辑界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_tag_index_view' => [
        "type"        => 2,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车标签管理列表界面', // 钩子名称
        "description" => "车辆后台车标签管理列表界面", //钩子描述
        "once"        => 1 // 是否只执行一次
    ],
    'car_admin_element_edit_view_right_sidebar' => [
        "type"        => 4,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车添加编辑界面右侧栏', // 钩子名称
        "description" => "车辆后台车添加编辑界面右侧栏", //钩子描述
        "once"        => 0 // 是否只执行一次
    ],
    'car_admin_element_edit_view_main' => [
        "type"        => 4,//钩子类型(默认为应用钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)
        "name"        => '车辆后台车添加编辑界面主要内容', // 钩子名称
        "description" => "车辆后台车添加编辑界面主要内容", //钩子描述
        "once"        => 0 // 是否只执行一次
    ],
];