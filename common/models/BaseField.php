<?php

namespace common\models;

use Yii;
use yii\base\Model;

/**
 * This is the model class for table "file".
 *
 * @property string $fid
 * @property string $tid
 * @property string $filename
 * @property string $uri
 * @property string $filemime
 * @property string $filesize
 * @property integer $status
 * @property integer $created
 * @property integer $changed
 */
class BaseField extends \yii\db\ActiveRecord
{
    const FIELD_TABLE_PREFIX = 'node_field_';
    public $nid = 0;
    public $delta = 0;
    public $deleted = 0;
    public $bundle = '';
    public $state = 1;
    public $value = '';
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return self::FIELD_TABLE_PREFIX.strtolower(basename(self::className()));
    }

    public function getFieldName(){
        return strtolower(self::className());
    }

    public function getValue(){
        return $this->value;
    }
    public function setValue($value){
        $this->value = $value;
    }
    public function setValues($data){
        $this->__set('nid',$data->nid);
        $this->__set('bundle',$data->type);
        $this->__set('value', $data->value);
    }

}
