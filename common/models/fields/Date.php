<?php

namespace common\models\fields;

use common\models\BaseField;
use Yii;

class Date extends BaseField
{

    public function rules()
    {
        return [
            [['value'], 'required','message' => 'asdfcd123'],
        ];

    }
}
