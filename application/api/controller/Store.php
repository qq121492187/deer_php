<?php

namespace app\api\controller;
/**
 * 店铺相关api
 */
class Store extends CommonController
{

    /**
     * 新增店铺
     */
    function addStore()
    {
        $storeUserName = $this->params['store_user_name'];
        $storeUserPhone = $this->params['store_user_phone'];
        $storeName = $this->params['store_name'];
        $storeArea = $this->params['store_area'];
        $storeAddress = $this->params['store_address'];
        $userId = $this->params['user_id'];
        $imgPath = $this->uploadImg($this->params['store_user_img']);
        $storeData = [
            'store_name' => $storeName,
            'store_area' => $storeArea,
            'store_address' => $storeAddress,
            'check' => 0,
            'store_owner_name' => $storeUserName,
            'store_owner_phone' => $storeUserPhone,
            'store_owner_pic' => $imgPath,
            'store_uid' => $userId
        ];
        $res = db('store')->insertGetId($storeData);
        if ($res !== false) {
            responseData($res);
        } else {
            responseError();
        }
    }

    private function uploadImg($file)
    {
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if ($info) {
            return '/uploads/' . $info->getSaveName();
        } else {
            responseError('图片上传失败');
        }
    }

}