<?php

namespace app\api\controller;

use think\Controller;

class CommonController extends Controller
{
    //传入的参数
    protected $params;

    protected function _initialize()
    {
        parent::_initialize();
        $this->params = $this->request->param(true);
        $this->filterParams($this->params);
    }

    protected function filterParams($params)
    {
        //检查userId
        if (isset($params['user_id'])) {
            $res = db('user')->where('user_id', $params['user_id'])->find();
            if (!$res) {
                responseError('用户ID失效');
            }
        }
    }
}
