<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 10.09.2019
 * Time: 0:10
 */

use Slim\Middleware\TokenAuthentication\UnauthorizedExceptionInterface;
class MyUnauthorizedException extends \Exception implements UnauthorizedExceptionInterface
{
}