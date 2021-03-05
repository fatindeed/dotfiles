# Backup and recover your dotfiles

# User Guide

1.  Install and launch HashiCorp Vault via Homebrew

    With your project set up, you can install and launch HashiCorp Vault.

    If you are using a Mac with homebrew, this is as simple as:

    ```
    brew install vault
    ```

    After you install Vault, launch it in a console window. This command also starts up a server process.

    ```
    ROOT_TOKEN_ID=$(uuidgen)
    echo -n "VAULT_DEV_ROOT_TOKEN_ID=${ROOT_TOKEN_ID}" > .env
    vault server --dev --dev-root-token-id="${ROOT_TOKEN_ID}"
    ```

    You should see the following as one of the last output lines:

    ```
    [INFO ] core: post-unseal setup complete
    ```

2.  Install and launch HashiCorp Vault via Docker

    ```
    docker run --rm -p 8200:8200 --env-file .env vault server -dev
    ```
