export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/apps/terraform/bin:${PATH}"

umask 0002

export GOPATH="${HOME}/src/go"
export PATH="${PATH}:${GOPATH}/bin"

## BGCH opsbag
export C2HBAG_ROOT=/home/ayqazi/work/bgch/src/opsbag

if [[ -f "${HOME}/.rbenv/bin/rbenv" ]] ; then
        export PATH="${HOME}/.rbenv/bin:${PATH}"
        eval "$(rbenv init -)"
fi

if [[ -f "${HOME}/.pyenv/bin/pyenv" ]] ; then
        export PYENV_ROOT="${HOME}/.pyenv"
        export PATH="${HOME}/.pyenv/bin:${PATH}"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
        export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi

# Test for an interactive shell.
[[ $- != *i* ]] && return

#### INTERACTIVE SHELL ONLY SETUP BELOW

# ANNOYING BELLS!
setterm -blength 0

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source "${HOME}/bin/prompts/ayq.beta.prompt"

export HISTCONTROL='erasedups:ignorespace'
export HISTFILESIZE=1000000
export HISTSIZE=50000

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

export BROWSER='xdg-open'
export TERMCMD='mrxvt'
export XEDITOR="emacs"
export EDITOR="emacs"
export VISUAL="emacs"
export PAGER='/usr/bin/less'

unset LESSOPEN
export LESS='-R'
export IGNOREEOF=4

case ${TERM} in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
	PROMPT_COMMAND='echo -ne "\033]0;${PWD/$HOME/~}\007"'
	;;
screen|screen.*)
	PROMPT_COMMAND='echo -ne "\033_${PWD/$HOME/~}\033\\"'
	;;
esac

test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

# Aliases (override existing ones)
unalias -a
alias ls='ls --col -F'
alias grep='grep --col'
alias egrep='egrep --col'
alias mysql='mysql --sigint-ignore'
alias ri='ri --no-gems'
alias be='bundle exec '
alias ber='bundle exec rake '
alias e='emacsclient -n '
alias bastion-ssh='ssh -o '\''ProxyCommand ssh -q dr-bastion nc %h %p'\'''

if [ -s ~/TODO ]; then cat ~/TODO; fi

# Armakuni specific
export CR_SHARED_ID=7782
