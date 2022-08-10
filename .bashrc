# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
# [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Reset
Color_Off='\e[0m'         # Text Reset

# Solarized Colors
SGrey='\e[0;17m'
Ketchup='\e[38;5;166m'

# Regular Colors
Black='\e[0;30m'          # Black
Red='\e[0;31m'            # Red
Green='\e[0;32m'          # Green
Yellow='\e[0;33m'         # Yellow
Blue='\e[0;34m'           # Blue
Purple='\e[0;35m'         # Purple
Cyan='\e[0;36m'           # Cyan
White='\e[0;37m'          # White

# Bold
BBlack='\e[1;30m'         # Black
BRed='\e[1;31m'           # Red
BGreen='\e[1;32m'         # Green
BYellow='\e[1;33m'        # Yellow
BBlue='\e[1;34m'          # Blue
BPurple='\e[1;35m'        # Purple
BCyan='\e[1;36m'          # Cyan
BWhite='\e[1;37m'         # White

# Underline
UBlack='\e[4;30m'         # Black
URed='\e[4;31m'           # Red
UGreen='\e[4;32m'         # Green
UYellow='\e[4;33m'        # Yellow
UBlue='\e[4;34m'          # Blue
UPurple='\e[4;35m'        # Purple
UCyan='\e[4;36m'          # Cyan
UWhite='\e[4;37m'         # White

# Background
On_Black='\e[40m'         # Black
On_Red='\e[41m'           # Red
On_Green='\e[42m'         # Green
On_Yellow='\e[43m'        # Yellow
On_Blue='\e[44m'          # Blue
On_Purple='\e[45m'        # Purple
On_Cyan='\e[46m'          # Cyan
On_White='\e[47m'         # White

# High Intensity
IBlack='\e[0;90m'         # Black
IRed='\e[0;91m'           # Red
IGreen='\e[0;92m'         # Green
IYellow='\e[0;93m'        # Yellow
IBlue='\e[0;94m'          # Blue
IPurple='\e[0;95m'        # Purple
ICyan='\e[0;96m'          # Cyan
IWhite='\e[0;97m'         # White

# Bold High Intensity
BIBlack='\e[1;90m'        # Black
BIRed='\e[1;91m'          # Red
BIGreen='\e[1;92m'        # Green
BIYellow='\e[1;93m'       # Yellow
BIBlue='\e[1;94m'         # Blue
BIPurple='\e[1;95m'       # Purple
BICyan='\e[1;96m'         # Cyan
BIWhite='\e[1;97m'        # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'     # Black
On_IRed='\e[0;101m'       # Red
On_IGreen='\e[0;102m'     # Green
On_IYellow='\e[0;103m'    # Yellow
On_IBlue='\e[0;104m'      # Blue
On_IPurple='\e[0;105m'    # Purple
On_ICyan='\e[0;106m'      # Cyan
On_IWhite='\e[0;107m'     # White

git_branch() {
  GIT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  [ -n "$GIT_BRANCH" ] && echo " ($GIT_BRANCH) "
}

PS1='\['$IYellow'\](\u)\['$IGreen'\]\h\['$BIYellow'\]:\['$Cyan'\]\w\['$Color_Off'\]\['$IRed'\]$(git_branch)\n\['$Ketchup'\]# '

export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
  . "$NVM_DIR/bash_completion"
fi
if [ -f ~/.fzf.bash ]; then
  . ~/.fzf.bash
fi
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export PATH="/usr/local/sbin:$PATH"
# export PATH=/usr/local/Cellar/python/3.7.4_1/bin:$PATH
export PATH=$PATH:"$HOME/.yarn/bin"
export PATH=$PATH:"$HOME/.tfenv/bin"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!**/node_modules' -g '!**/docs'"
export GOBIN="$HOME/go/bin"
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export BASH_SILENCE_DEPRECATION_WARNING=1
export LUA_LSP_PATH="$HOME/tools/lua-language-server/bin"
export PATH=$PATH:$GOBIN:$LUA_LSP_PATH:"$GOROOT/bin"
export VIM_HOME="$HOME/.config/nvim/"
export MYVIMRC="$VIM_HOME/init.lua"
export PROJECTS_PATH="$HOME/Projects"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
