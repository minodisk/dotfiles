source ~/.zplug/init.zsh

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-history-substring-search", hook-build:"__zsh_version 4.3"
zplug "zsh-users/zsh-syntax-highlighting"
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

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# prompt
export GIT_TERMINAL_PROMPT=1
bg_base='%K{237}'
fg_base='%F{246}'
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_BRANCH="%{%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[blue]%}$bg_base%{o%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]$bg_base%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[yellow]$bg_base%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]$bg_base%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]$bg_base%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]$bg_base%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]$bg_base%}%{✔%G%}"
PROMPT='%{$fg[black]$bg[blue]%} %. %{$fg[blue]$bg_base%}%{$fg_base$bg_base%} $(git_super_status)%{$fg_base$bg_base%} %{%F{237}$bg[black]%}%{%f%k$fg[reset]$bg[reset]%} '

# history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Git
export PATH="/usr/local/share/git-core/contrib/diff-highlight:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

# peco
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# go
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:$PATH"

# rust
# export LD_LIBRARY_PATH=$(rustc --print sysroot)/lib:$LD_LIBRARY_PATH
export PATH="$HOME/.cargo/bin:$PATH"

# n
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# vim
alias vi='nvim'
alias vim='nvim'

# docker
alias docker-compose-up="docker-compose stop && docker-compose rm -f && docker-compose build && docker-compose up"
alias docker-ps="docker ps -a -q"
alias docker-stop-all="docker stop \`docker-ps\`"
alias docker-rm="docker rm \`docker-ps\`"
alias docker-rmi="docker rmi \`docker images | awk '/^<none>/ { print \$3 }'\`"

# tmux
alias tmux="tmux attach || tmux new-session \; source-file ~/.tmux.session"
alias exit="tmux detach"

# BFG
alias bfg='java -jar /usr/local/jar/bfg.jar'

# teensy_loader
alias teensy_loader_="teensy_loader --mcu=atmega32u4 -vw"

# Android
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

if [ -f "$HOME/.zsecret" ]; then source "$HOME/.zsecret"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

source ~/.zprofile
