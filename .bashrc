#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

PARENT_COMMAND="$(ps -o comm= $PPID)"

# Drop into fish shell
if [ -t 1 ] && ! [[ "$PARENT_COMMAND" =~ ^(fish|pipenv)$ ]] && command -v fish >/dev/null 2>&1; then
    exec fish
fi
