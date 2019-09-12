<?php

namespace app\api\controller;

/**
 */
class Order extends CommonController
{
    function addOrder()
    {
        $params = $this->request->except([
            'order_id', 'order_uid', 'order_status', 'order_time'
        ]);
        $params['order_status'] = 1;
        $params['order_time'] = date("Y.m.d H:i");
        $res = db('order')->insert($params);
        if ($res) {
            responseData([], '新增成功');
        }
    }

    /**
     * @param $filterType
     * 0 - 新订单 1 - 个人所有订单
     * 2 - 待配送 3 - 待完成
     * 4 - 已完成 5 - 已取消
     */
    function listOrder()
    {
        $filterType = $this->params['filter_type'];
        switch ($filterType) {
            case 0:
                $this->listNewOrder();
                break;
            case 1:
                $this->listAllOrder($this->params['user_id']);
                break;
        }
    }

    private function listNewOrder()
    {
        $res = db('order')->where('order_uid', null)->select();
        if ($res) {
            responseData($res);
        } else {
            responseError();
        }
    }

    private function listAllOrder($userId)
    {
        $res = db('order')->where('order_uid', $userId)->select();
        if ($res) {
            responseData($res);
        }
    }
}