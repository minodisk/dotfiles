# git
export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"

# go
export GOPATH="$HOME/workspace/go"
export PATH="$GOPATH/bin:$PATH"

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# app engine
export PATH="$HOME/go_appengine:$PATH"

# docker
alias docker-rm="docker rm \`docker ps -a -q\`"
alias docker-rmi="docker rmi \`docker images | awk '/^<none>/ { print \$3 }'\`"
# alias docker-start="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
# alias docker-stop-all="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"
# fpath=(~/.zsh/completion $fpath)
# autoload -Uz compinit && compinit -i

# tmux
# alias tmux="tmux attach || tmux new-session \; source-file ~/.tmux.session"
# alias exit="tmux detach"
