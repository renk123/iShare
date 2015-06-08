<?php
namespace mobile\controllers\node;

use common\models\nodes\book\Book;
use common\models\nodes\book\BookForm;
use common\controllers\BaseController;
use Yii;
use common\models\LoginForm;
use common\models\PasswordResetRequestForm;
use common\models\ResetPasswordForm;
use common\models\SignupForm;
use common\models\ContactForm;
use yii\base\InvalidParamException;
use yii\helpers\Html;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use yii\web\UploadedFile;

/**
 * Book controller
 */
class NodeController extends BaseController
{
    public $pageTitle = '';

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [];
    }
}
