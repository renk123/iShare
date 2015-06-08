<?php
namespace common\models\nodes\book;

use common\models\BaseModel;

use common\models\behaviors\AttachFieldsBehavior;
use common\models\fields\Body;
use common\models\fields\Date;
use common\models\fields\File;
use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\AttributeBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

class Book extends BaseModel
{
    public $type = 'book';

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
                'class' => AttachFieldsBehavior::className(),
                'extraFields' => [
                    'body'=>new Body(),
                    'file' => new File(),
                ],

            ],

            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        $rules = [
            [['title'], 'required'],
            [['file','body'], 'trim']
        ];

        return $rules;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'title' => 'title',
            'body' => 'description',
        ];
    }

}
