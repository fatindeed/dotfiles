<?php

// https://github.com/docker/docker-credential-helpers

define('DS', DIRECTORY_SEPARATOR);

function getCmd() {
    $filename = $_SERVER['HOME'] . DS . '.docker' . DS . 'config.json';
    $contents = file_get_contents($filename);
    if (!$contents) {
        throw new Exception('failed to get user\'s docker config', 1);
    }
    $data = json_decode($contents);
	return escapeshellcmd('docker-credential-' . $data->credsStore);
}