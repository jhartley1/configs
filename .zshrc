# Lines configured by zsh-newuser-install

TERM=screen-256color
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch notify
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jhartley/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


zstyle ':completion:*' rehash true

setopt HIST_IGNORE_DUPS

autoload -U promptinit
promptinit
prompt adam2 

#Start History Search
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

bindkey '^[[A' history-beginning-search-backward 
bindkey '^[[B' history-beginning-search-forward
#End history search


#Dirstack
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus
#End Dirstack

#Start help
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help
#End help

#Start Aliases
alias la='ls -al --color=auto'
alias ls='ls --color=auto'
alias emacs='emacs -nw'
alias pacman='pacmatic'

export NVM_DIR="/home/jhartley/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
source '/home/jhartley/Downloads/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/jhartley/Downloads/google-cloud-sdk/completion.zsh.inc'
