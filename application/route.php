<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;

/**用户相关**/
//注册
Route::post('user/register', 'api/user/register');
//获取验证码
Route::get('user/getCode', 'api/user/getCode');
//登录
Route::post('user/login', 'api/user/login');
//修改密码
Route::post('user/updatePassword', 'api/user/updatePassword');

/*****店铺相关*****/
//新增店铺
Route::post('store/addStore', 'api/store/addStore');

/*********订单**********/
//新增订单
Route::post('order/addOrder', 'api/order/addOrder');
Route::get('order/listOrder', 'api/order/listOrder');
Route::get('order/index', 'api/order/index');
Route::post('order/complete', 'api/order/completeOrder');
Route::get('order/search', 'api/order/searchOrder');
Route::get('order/detail', 'api/order/orderDetail');