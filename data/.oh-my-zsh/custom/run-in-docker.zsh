alias run-in-docker='docker run -u `id -u` -it --rm'
which php >/dev/null 2>&1
if [ $? -ne 0 ]; then
    # https://hub.docker.com/_/php
    alias php='run-in-docker --workdir /app -v=`pwd`:/app php:alpine'
fi
which composer >/dev/null 2>&1
if [ $? -ne 0 ]; then
    # https://hub.docker.com/_/composer
    alias composer='run-in-docker -v=`pwd`:/app -v="${HOME}/.composer":/tmp composer'
fi
# https://hub.docker.com/r/fatindeed/phpunit
alias phpunit='run-in-docker -v=`pwd`:/app fatindeed/phpunit'
# https://hub.docker.com/r/phpstan/phpstan
alias phpstan='run-in-docker -v=`pwd`:/app phpstan/phpstan'
which vault >/dev/null 2>&1
if [ $? -ne 0 ]; then
    # https://hub.docker.com/_/vault
    alias vault='run-in-docker -p 8200:8200 vault'
fi
# https://hub.docker.com/r/minio/mc
alias mc='run-in-docker -v="${HOME}/.mc":/root/.mc minio/mc'
# https://hub.docker.com/r/opencoconut/ffmpeg
alias ffmpeg='run-in-docker -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg'
