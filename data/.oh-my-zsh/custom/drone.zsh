function drone-autosign() {
    if [ -z "$DRONE_GIT_HOST" ]; then
        >&2 echo "git host not defined"
        return
    fi
    local url=$(git config --get remote.origin.url)
    if [ -z "$url" ]; then
        >&2 echo "not in git repo"
        return
    fi
    if [[ $url != *"$DRONE_GIT_HOST"* ]]; then
        >&2 echo "git host not suppported"
        return
    fi
    if [[ ${url:0:4} == "git@" ]]; then
        # git@<host>:<owner>/<repo>.git
        url=${url#git@$DRONE_GIT_HOST:}
    fi
    if [[ ${url:0:8} == "https://" ]]; then
        # https://<host>/<owner>/<repo>.git
        url=${url#https://$DRONE_GIT_HOST/}
    fi
    drone sign ${url%.git}
}