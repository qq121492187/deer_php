<?php

namespace app\api\controller;

/**
 * 订单相关
 */
class Order extends CommonController
{

    /**
     * 订单首页信息
     */
    function index()
    {
        $userId = $this->params['user_id'];
        $newOrderCount = db('order')->where('order_uid', null)->count();
        $where['order_uid'] = $userId;
        $where['order_status'] = 2;
        $waiteSendCount = db('order')->where($where)->count();
        $where['order_status'] = 3;
        $waiteCompleteCount = db('order')->where($where)->count();
        $where['order_status'] = 4;
        $alreadyCompleteCount = db('order')->where($where)->count();
        $where['order_status'] = 5;
        $alreadyCancelCount = db('order')->where($where)->count();

        $data = [
            'new_order_count' => $newOrderCount,
            'waite_send_count' => $waiteSendCount,
            'waite_complete_count' => $waiteCompleteCount,
            'already_complete_count' => $alreadyCompleteCount,
            'already_cancel_count' => $alreadyCancelCount
        ];
        responseData($data);
    }

    /**
     * 增加订单
     * @param
     */
    function addOrder()
    {
        $data['order_contact'] = $this->params['order_contact'];
        $data['order_ctname'] = $this->params['order_ctname'];
        $data['order_type'] = $this->params['order_type'];
        $data['order_address'] = $this->params['order_address'];
        $data['order_content'] = $this->params['order_content'];
        $data['order_price'] = $this->params['order_price'];
        $data['order_status'] = 1;
        $data['order_time'] = date("Y.m.d H:i");
        $orderId = rand(0, 10000) . time();
        $data['order_id'] = $orderId;
        $goodsArr = explode(',', $this->params['order_gids']);

        $res = db('order')->insert($data);
        if ($res) {
            //插入商品
            foreach ($goodsArr as $value) {
                $arr = explode('.', $value);
                $insertData = [
                    'cart_oid' => $orderId,
                    'cart_gid' => $arr[0],
                    'cart_count' => $arr[1]
                ];
                db('cart')->insert($insertData);
            }

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
                $where['order_uid'] = null;
                break;
            case 1:
                $where['order_uid'] = $this->params['user_id'];
                break;
            case 2:
            case 3:
            case 4:
            case 5:
                $where = [
                    'order_uid' => $this->params['user_id'],
                    'order_status' => $filterType
                ];
                break;
        }

        $data = [];

        $res = db('order')
            ->where($where)
            ->select();

        foreach ($res as $value) {
            $orderId = $value['order_id'];
            $cart = db('cart')
                ->alias('c')
                ->join('goods g', 'g.goods_id=c.cart_gid')
                ->where('cart_oid', $orderId)
                ->field(['goods_id', 'goods_name', 'goods_desc', 'goods_price', 'cart_count'])
                ->select();
            if ($cart) {
                $value['goods'] = $cart;
            }
            array_push($data, $value);
        }
        responseData($data);

    }

    /**
     * 完成订单
     */
    function completeOrder()
    {
        $userId = $this->params['user_id'];
        $orderId = $this->params['order_id'];
        $res = db('order')->where('order_id', $orderId)->find();
        if (!$res) {
            responseError('无此订单');
        }
        if ($res['order_uid'] != $userId) {
            responseError('订单异常');
        }
        $payType = $this->params['pay_type'];
        $res = db('order')->where('order_id', $orderId)->update([
            'order_status' => 4,
            'order_pay_type' => $payType
        ]);
        if ($res !== false) {
            responseData([]);
        } else {
            responseError(mssql_get_last_message());
        }
    }

    /**
     * 查询订单
     */
    function searchOrder()
    {
        $keyword = $this->params['keyword'];
        //todo
    }

    /**
     * 订单详情
     */
    function orderDetail()
    {
        $order = db('order')
            ->where('order_id', $this->params['order_id'])
            ->find();
        $carts = db('cart')
            ->alias('c')
            ->join('goods g', 'g.goods_id=c.cart_gid')
            ->field(['cart_count', 'goods_id', 'goods_name', 'goods_desc', 'goods_price'])
            ->where('cart_oid', $this->params['order_id'])
            ->select();
        $order['carts'] = $carts;
        responseData($order);
    }
}