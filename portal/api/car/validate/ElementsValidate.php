<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2017 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 小夏 < 449134904@qq.com>
// | Date: 2019/01/11
// | Time:下午 03:24
// +----------------------------------------------------------------------
namespace api\car\validate;

use think\Validate;

class ElementsValidate extends Validate
{
    protected $rule = [
        'element_title'        =>  'require',
	    'element_content'      =>  'require',
	    'brands'        =>  'require'
    ];
    protected $message = [
        'element_title.require'    =>  '车标题不能为空',
	    'element_content.require'  =>  '内容不能为空',
	    'brands.require'    =>  '车品牌不能为空'
    ];

    protected $scene = [
        'element'  => [ 'element_title' , 'element_content' , 'brands' ],
        'page' => ['element_title']
    ];
}