<?php
namespace common\models;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class BaseNodeForm extends BaseForm
{
    public $title;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            // title is always required
            ['title', 'required'],
        ];
    }
}
