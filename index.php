<?php
error_reporting(1);

require_once 'config/conf.php';
require_once 'model/db.php';
require_once 'controller/class.Controller.php';
require_once 'model/class.Model.php';

$controller = new Controller();
$controller->handleRequest();




