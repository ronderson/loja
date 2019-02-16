<?php
require 'environment.php';

$config = array();

if(ENVIRONMENT == 'development'){
    define("BASE_URL","http://localhost/loja/"); 
    $config['dbname'] = 'loja';
    $config['dbhost'] = 'localhost';
    $config['dbuser'] = 'postgres';
    $config['dbpass'] = '123456';
}else{
    define("BASE_URL","http://localhost/loja/"); 
    $config['dbname'] = 'loja';
    $config['dbhost'] = 'localhost';
    $config['dbuser'] = 'postgres';
    $config['dbpass'] = '123456';
}
global $db;
try{
    
    $db = new PDO("pgsql:host=".$config['dbhost'].";port=5432;dbname=".$config['dbname'],$config['dbuser'],$config['dbpass']);

}catch(PDOExcpetion $e){
    echo "ERRO BANCO".$e->getMessage();
    exit;
}
?>
