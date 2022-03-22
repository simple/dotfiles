export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLOR=1
export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

alias ls='ls -FGH'

DOTFILES_DIR=$HOME/playground/dotfiles
source $DOTFILES_DIR/prompt_resources
function ps1_from_exit_status {
	if [ $1 -eq 0 ]; then face=$(emoji yheart); else face=$(emoji scream); fi
	printf "\n$EBLACK[$(date +'%H:%M:%S')]$ERED@$(hostname -s):$NO_COLOR"
	printf "$(pwd | sed -e 's@/Users/wongi.ju@~@')"
	printf "\n$face "
}
PS1="\$(ps1_from_exit_status \$?) "
PS2="$ARROW18 "

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:$HOME/bin
