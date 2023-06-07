<?php

try {
    require('common.php');

    $cmdname = getCmd();
    $in = file_get_contents('php://stdin');
    $data = json_decode($in);
    if (json_last_error() != JSON_ERROR_NONE) {
        throw new Exception(json_last_error_msg(), 2);
    }
    foreach ($data as $creds) {
        unset($out, $retval);
        exec('echo ' . escapeshellarg(json_encode($creds)) . ' | ' . $cmdname . ' store', $out, $retval);
        if ($retval > 0) {
            throw new Exception('credential store failed: ' . implode("\n", $out), 3);
        }
    }
} catch (Throwable $th) {
    echo $th->getMessage();
    exit($th->getCode());
}
