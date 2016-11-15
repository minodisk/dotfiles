source ~/.zplug/init.zsh

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "felixr/docker-zsh-completion"
zplug "olivierverdier/zsh-git-prompt", use:zshrc.sh
# zplug "themes/agnoster", from:oh-my-zsh

# ZSH_THEME="bullet-train"
# zplug "robbyrussell/oh-my-zsh"
# setopt prompt_subst # Make sure propt is able to be generated properly.
# zplug "adambiggs/zsh-theme", use:adambiggs.zsh-theme
# zplug "caiogondim/bullet-train-oh-my-zsh-theme", from:oh-my-zsh
# zplug "arialdomartini/oh-my-git", use:prompt.sh, from:oh-my-zsh


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# PROMPT='%~%b$(git_super_status) %# '
# PROMPT='%{%f%b%k%}$(prompt_agnoster_main) '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[red]%}%{● %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg_bold[red]%}%{✖ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg_bold[blue]%}%{✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg_bold[white]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg_bold[white]%}%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔ %G%}"
PROMPT='%~%b $(git_super_status)
%{$fg_bold[red]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[green]%}❯${reset_color} '
RPROMPT=''

# The next line updates PATH for the Google Cloud SDK.
source '/Users/minodisk/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/minodisk/google-cloud-sdk/completion.zsh.inc'
