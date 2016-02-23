# export PATH=/usr/local/bin:/usr/bin
# export PATH=~/Library/Python/2.7/bin:$PATH
# export EDITOR='vim'
# export LANG=ja_JP.UTF-8
#
# # 履歴
# export HISTFILE=${HOME}/.zsh_history
# export HISTSIZE=1000
# export SAVEHIST=10000
# setopt hist_ignore_dups
# setopt EXTENDED_HISTORY
#
# # エイリアス
# alias la='ls -a'
# alias ll='ls -al'
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
# alias mkdir='mkdir -p'
#
# #補完機能を使用する
# autoload -U compinit #promptinit
# compinit
# zstyle ':completion::complete:*' use-cache true
# #zstyle ':completion:*:default' menu select true
# zstyle ':completion:*:default' menu select=1
#
# #大文字、小文字を区別せず補完する
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#
# #補完でカラーを使用する
# autoload colors
# zstyle ':completion:*' list-colors "${LS_COLORS}"
#
# #kill の候補にも色付き表示
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
#
# #コマンドにsudoを付けても補完
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
#
# # sindresorhus/pure
# # autoload -U promptinit && promptinit
# # prompt pure
# # . $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# go
export GOPATH="$HOME/workspace"
export PATH="$GOPATH/bin:$PATH"

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# docker
alias dockerstart="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
