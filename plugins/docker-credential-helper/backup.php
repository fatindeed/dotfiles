<?php

try {
    require('common.php');

    $cmdname = getCmd();
    exec($cmdname . ' list', $out, $retval);
    $output = implode("\n", $out);
    if ($retval > 0) {
        throw new Exception('credential list failed: ' . $output, 2);
    }
    $credentials = json_decode($output, true);
    $result = [];
    if (count($credentials) > 0) {
        foreach ($credentials as $registry => $username) {
            unset($out, $retval);
            exec('echo ' . escapeshellarg($registry) . ' | ' . $cmdname . ' get', $out, $retval);
            $output = implode("\n", $out);
            if ($retval > 0) {
                throw new Exception('credential get failed: ' . $output, 3);
            }
            $result[] = json_decode($output);
        }
    }
    echo json_encode($result);
} catch (Throwable $th) {
    echo $th->getMessage();
    exit($th->getCode());
}
