source ~/.zplug/init.zsh

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "felixr/docker-zsh-completion"
zplug "olivierverdier/zsh-git-prompt", use:zshrc.sh
zplug "littleq0903/gcloud-zsh-completion"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load #--verbose

# history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[red]%}%{o%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[red]%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[blue]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[white]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[white]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[white]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
# PROMPT='%.%{$fg_bold[red]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[green]%}❯${reset_color} '
PROMPT='%. $(git_super_status) $ '
# RPROMPT=''

# peco
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# git
export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"
export GIT_TERMINAL_PROMPT=1

# go
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# ndenv
# export PATH="$HOME/.ndenv/bin:$PATH"
# eval "$(ndenv init -)"

# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# app engine
# export PATH="$HOME/go_appengine:$PATH"

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
# alias f='ranger'

# BFG
alias bfg='java -jar /usr/local/jar/bfg.jar'

# Android
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/minodisk/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/minodisk/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/minodisk/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/minodisk/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
