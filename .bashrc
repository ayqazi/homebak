export PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}"

umask 0022

export GOPATH="${HOME}/src/go"
export PATH="${PATH}:${GOPATH}/bin"

if [ -d "${HOME}/.bashrc.d/" ]; then
    for i in "${HOME}/.bashrc.d/"*; do
        source "${i}"
    done
fi

if [ -f "${HOME}/.rbenv/bin/rbenv" ] ; then
        export PATH="${HOME}/.rbenv/bin:${PATH}"
        eval "$(rbenv init -)"
fi

if [ -f "${HOME}/.pyenv/bin/pyenv" ] ; then
        export PYENV_ROOT="${HOME}/.pyenv"
        export PATH="${HOME}/.pyenv/bin:${PATH}"
        eval "$(pyenv init -)"
        eval "$(pyenv init --path)"

        if [ -d "${HOME}/.pyenv/plugins/pyenv-virtualenv" ] ; then
                eval "$(pyenv virtualenv-init -)"
        fi
fi

# Test for an interactive shell.
[[ $- != *i* ]] && return 0

#### INTERACTIVE SHELL ONLY SETUP BELOW

# ANNOYING BELLS!
setterm -blength 0 &> /dev/null

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source "${HOME}/bin/prompts/ayq.beta.prompt"

export HISTCONTROL='erasedups:ignorespace'
export HISTFILESIZE=999999999

shopt -s histappend
shopt -s checkwinsize

export BROWSER='xdg-open'
export XEDITOR="vim"
export EDITOR="vim"
export VISUAL="vim"
export PAGER='/usr/bin/less'

unset LESSOPEN
export LESS='-R'
export IGNOREEOF=4

export DISABLE_SPRING=1 # always off by default, enable if we need it

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

if [ -s ~/TODO ]; then cat ~/TODO; fi

true
