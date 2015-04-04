export EDITOR='vim'
export LANG=ja_JP.UTF-8

# プロンプト
# PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
# %# "
# PROMPT="[%n@%m %~]%(!.#.$) "

# エイリアス
alias la='ls -a'
alias ll='ls -al'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

#補完機能を使用する
autoload -U compinit promptinit
compinit
zstyle ':completion::complete:*' use-cache true
#zstyle ':completion:*:default' menu select true
zstyle ':completion:*:default' menu select=1

#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#補完でカラーを使用する
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

#kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

#コマンドにsudoを付けても補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


# go
export GOPATH="$HOME/.go"

# ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# sindresorhus/pure
autoload -U promptinit && promptinit
prompt pure
