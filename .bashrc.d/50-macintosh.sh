export BASH_SILENCE_DEPRECATION_WARNING=1

export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

if [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ] ; then
    . /opt/homebrew/etc/profile.d/bash_completion.sh
fi
