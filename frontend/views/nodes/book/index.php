<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
/* @var $this yii\web\View */
$this->title = '分享书籍信息';
?>
<div class="site-index">

    <div class="body-content">

        <div class="row">
            <div class="col-lg-5">
                <?php $form = ActiveForm::begin(['id' => 'book-form','options' => ['enctype' => 'multipart/form-data']]); ?>
                <?= $form->field($model, 'title') ?>
                <?= $form->field($model, 'body')->textarea(['placeholder'=>'10-100字']) ?>
                <?= $form->field($model, 'date2') ?>
                <?= $form->field($model, 'file')->fileInput() ?>

                <div class="form-group">
                    <?= Html::submitButton('提交', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
                </div>
                <?php ActiveForm::end(); ?>
            </div>
        </div>

    </div>
</div>
