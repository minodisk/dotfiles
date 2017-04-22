# git
export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"
export GIT_TERMINAL_PROMPT=1

# go
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# app engine
export PATH="$HOME/go_appengine:$PATH"

# vim
alias ovim='vim'
alias vim='nvim'
alias vi='nvim'

# docker
alias docker-compose-up="docker-compose stop && docker-compose rm -f && docker-compose build && docker-compose up"
alias docker-ps="docker ps -a -q"
alias docker-stop-all="docker stop \`docker-ps\`"
alias docker-rm="docker rm \`docker-ps\`"
alias docker-rmi="docker rmi \`docker images | awk '/^<none>/ { print \$3 }'\`"
# alias docker-start="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
# alias docker-stop-all="docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)"
# fpath=(~/.zsh/completion $fpath)
# autoload -Uz compinit && compinit -i

# tmux
# alias tmux="tmux attach || tmux new-session \; source-file ~/.tmux.session"
# alias exit="tmux detach"

# ranger
alias f='ranger'

alias bfg='java -jar ~/jar/bfg-1.12.8.jar'
