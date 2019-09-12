<?php

namespace app\api\model;

class UserModel
{

    public function generateCode($length)
    {
        $code = '';
        for ($i = 0; $i < $length; $i++) {
            $code .= rand(0, 10);
        }
        return $code;
    }

}