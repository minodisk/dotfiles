source ~/.zplug/init.zsh

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "felixr/docker-zsh-completion"
zplug "olivierverdier/zsh-git-prompt", use:zshrc.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

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

source ~/.zprofile

# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/usr/local/google-cloud-sdk/completion.zsh.inc'

# peco
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# Clamshell
gconftool-2 --type string --set /apps/gnome-power-manager/buttons/lid_ac "nothing"
