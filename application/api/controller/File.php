<?php

namespace app\api\controller;

class File extends CommonController
{

    /**
     * 上传文件
     */
    function upload()
    {
        $file = $this->params['file'];
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if ($info) {
            responseData('/uploads/' . $info->getSaveName());
        } else {
            responseError('上传失败');
        }
    }

}
