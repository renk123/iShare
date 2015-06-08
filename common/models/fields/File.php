<?php

namespace common\models\fields;

use common\models\BaseField;
use yii\behaviors\TimestampBehavior;
use Yii;

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
class File extends BaseField
{

    const UPLOAD_PATH = 'uploads/';
    public $file;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'file';
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

//    public function rules()
//    {
//        return [
//            [['file'], 'file', 'checkExtensionByMimeType' => false, 'extensions' => 'gif, jpg', 'maxFiles' => 10],
//        ];
//
//    }

    public function save($runValidation = true, $attributeNames = null)
    {
        if(empty($this->filename)){
            return;
        }
        $this->uri = self::UPLOAD_PATH . $this->file->baseName . '.' . $this->file->extension;
        $this->file->saveAs($this->uri);
        parent::save($runValidation, $attributeNames);
    }

    public function setValue($file){
        if(empty($file)){
            return ;
        }
        $this->file = $file;
        $this->filename = $this->file->baseName . '.' . $this->file->extension;
        $this->__set('filemime',$file->type);
        $this->__set('filesize',$file->size);
    }

    public function setValues($data){
        $this->__set('nid',$data->nid);
    }
}
