which go >/dev/null 2>&1
if [ $? -eq 0 ]; then
    # plugins=(... golang)
    source $ZSH/plugins/golang/golang.plugin.zsh
fi