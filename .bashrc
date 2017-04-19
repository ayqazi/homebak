# Test for an interactive shell.
[[ $- != *i* ]] && return

# ANNOYING BELLS!
setterm -blength 0

umask 0002

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

. ~/bin/prompts/ayq.beta.prompt

export HISTCONTROL='erasedups:ignorespace'
export HISTFILESIZE=1000000
export HISTSIZE=50000

shopt -s histappend
shopt -s checkwinsize

export BROWSER='xdg-open'
export TERMCMD='mrxvt'
export XEDITOR="emacs"
export EDITOR="emacs"
export VISUAL="emacs"
export PAGER='/usr/bin/less'

unset LESSOPEN
export LESS='-R'
export IGNOREEOF=4

export GOPATH="${HOME}/src/gopath"

unset RUBYOPT
export JRUBY_OPTS='--1.9 -J-XX:+TieredCompilation'

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
alias e="emacsclient -n "
alias bastion-ssh='ssh -o '\''ProxyCommand ssh -q dr-bastion nc %h %p'\'''

alias imagvault='ansible-vault --vault-password-file ~/work/imagination/.vault-password '
alias imagplaybook='ansible-playbook --vault-password-file ~/work/imagination/.vault-password '

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="${HOME}/apps/terraform/bin:${PATH}"

if [ -s ~/TODO ]; then cat ~/TODO; fi
