#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Created by `pipx` on 2024-05-22 15:24:17
export PATH="$PATH:/home/perseus/.local/bin"

eval "$(oh-my-posh init bash)"
#eval "$(oh-my-posh init bash --config ~/.mytheme.omp.json)"