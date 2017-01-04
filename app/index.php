<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require './vendor/autoload.php';

$app = new \Slim\App;

/**
 * Default Index - Script de demonstração de Auto Scaling e Load Balance
 * @var string
 */
$app->get('/', function (Request $request, Response $response) use ($app) {
    $response->getBody()->write("<img src='https://credencial.imasters.com.br/media/imasters/parceiros/840_parceiro.png' />");
    return $response;
});

/**
 * Pega o hostname da máquina
 */
$app->get('/whoami', function (Request $request, Response $response) {
    $response->getBody()->write(gethostname());
    return $response;
});

/**
 * Pega o IP da máquina
 */
$app->get('/cade', function (Request $request, Response $response) {
    $response->getBody()->write(getHostByName(getHostName()));
    return $response;
});

$app->run();
