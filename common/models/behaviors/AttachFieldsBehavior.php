<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace common\models\behaviors;

use common\models\BaseField;
use common\models\fields\File;
use yii\base\Model;
use yii\base\View;
use yii\base\ViewEvent;
use yii\db\BaseActiveRecord;
use yii\db\Expression;
use yii\base\Behavior;
use yii\base\Event;
use yii\behaviors;
use yii\web\UploadedFile;

/**
 * TimestampBehavior automatically fills the specified attributes with the current timestamp.
 *
 * To use TimestampBehavior, insert the following code to your ActiveRecord class:
 *
 * ```php
 * use yii\behaviors\TimestampBehavior;
 *
 * public function behaviors()
 * {
 *     return [
 *         TimestampBehavior::className(),
 *     ];
 * }
 * ```
 *
 * By default, TimestampBehavior will fill the `created_at` and `updated_at` attributes with the current timestamp
 * when the associated AR object is being inserted; it will fill the `updated_at` attribute
 * with the timestamp when the AR object is being updated. The timestamp value is obtained by `time()`.
 *
 * If your attribute names are different or you want to use a different way of calculating the timestamp,
 * you may configure the [[createdAtAttribute]], [[updatedAtAttribute]] and [[value]] properties like the following:
 *
 * ```php
 * use yii\db\Expression;
 *
 * public function behaviors()
 * {
 *     return [
 *         [
 *             'class' => TimestampBehavior::className(),
 *             'createdAtAttribute' => 'create_time',
 *             'updatedAtAttribute' => 'update_time',
 *             'value' => new Expression('NOW()'),
 *         ],
 *     ];
 * }
 * ```
 *
 * In case you use an [[Expression]] object as in the example above, the attribute will not hold the timestamp value, but
 * the Expression object itself after the record has been saved. If you need the value from DB afterwards you should call
 * the [[\yii\db\ActiveRecord::refresh()|refresh()]] method of the record.
 *
 * TimestampBehavior also provides a method named [[touch()]] that allows you to assign the current
 * timestamp to the specified attribute(s) and save them to the database. For example,
 *
 * ```php
 * $model->touch('creation_time');
 * ```
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @author Alexander Kochetov <creocoder@gmail.com>
 * @since 2.0
 */
class AttachFieldsBehavior extends behaviors\AttributeBehavior
{

    public $extraFields = [];
    /**
     * @var callable|Expression The expression that will be used for generating the timestamp.
     * This can be either an anonymous function that returns the timestamp value,
     * or an [[Expression]] object representing a DB expression (e.g. `new Expression('NOW()')`).
     * If not set, it will use the value of `time()` to set the attributes.
     */
    public $value;


    /**
     * @inheritdoc
     */
    public function init()
    {
        parent::init();
    }

    public function __get($name)
    {
        if(array_key_exists($name, $this->extraFields)){
            return $this->extraFields[$name]->getValue();
        }
        return parent::__get($name);
    }

    public function __set($name, $value)
    {
        if(array_key_exists($name, $this->extraFields)){
            $fieldInstance = $this->extraFields[$name];
            if($fieldInstance instanceof File){
                $value = UploadedFile::getInstance($this->owner, 'file');
            }
            $fieldInstance->setValue($value);
            return;
        }else{
            parent::__set($name, $value);
        }
    }

    public function events()
    {
        return [
            Model::EVENT_BEFORE_VALIDATE => 'validateExtraFiled',
            BaseActiveRecord::EVENT_AFTER_INSERT => 'saveExtraFiled',
        ];
    }

    public function canGetProperty($name, $checkVars = true)
    {
        return array_key_exists($name, $this->extraFields) || parent::canGetProperty($name, $checkVars);
    }

    public function canSetProperty($name, $checkVars = true)
    {
        return array_key_exists($name, $this->extraFields) || parent::canSetProperty($name, $checkVars);
    }

    public function validateExtraFiled($event){
        foreach($this->extraFields as $key => $extraField){
            if(!$extraField->validate()){
                $this->owner->addError($key,$extraField->getFirstError('value'));
            }
        }
    }

    public function saveExtraFiled($event){
        $sender = $event->sender;
        foreach($this->extraFields as $key => $extraField){
            $sender->value = $sender->$key;
            $extraField->setValues($sender);
            $extraField->save();
        }
    }

}
