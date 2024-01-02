export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(/opt/homebrew/bin/brew shellenv)"

if [ -f /opt/homebrew/etc/bash_completion.d/brew ] ; then
    . /opt/homebrew/etc/bash_completion.d/brew
fi
