# Backup and recover your dotfiles

## User Guide

1.  Generating gpg keys and keyrings

    ```sh
    gpg --gen-key
    ```

2.  Export your gpg keys

    ```sh
    gpg --output secret/pubring.asc --armor --export <user-id>
    ```

    ```sh
    gpg --output secret/secring.asc --armor --export-secret-key <user-id>
    ```

    ```sh
    echo -n "your passphrase" > secret/passphrase.txt
    ```

## References

- https://dotfiles.github.io/