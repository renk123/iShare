<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\File */

$this->title = 'Update File: ' . ' ' . $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Files', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="file-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>