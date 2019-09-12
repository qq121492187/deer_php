<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件


function responseData($data, $msg = "请求成功")
{
    responseResult(1, $msg, $data);
}

function responseError($msg = "请求失败")
{
    responseResult(2, $msg);
}

function responseResult($code, $msg, $data = [])
{
    $result = [
        "code" => $code,
        "msg" => $msg,
        "data" => $data
    ];
    echo json_encode($result);
    die;
}