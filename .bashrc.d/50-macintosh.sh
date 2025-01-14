export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(/opt/homebrew/bin/brew shellenv)"

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

export SSH_AUTH_SOCK="${HOME}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

# Added by Toolbox App
export PATH="$PATH:/Users/asfand/Library/Application Support/JetBrains/Toolbox/scripts"

if [ -f "/opt/homebrew/opt/asdf/libexec/asdf.sh" ] ; then
	. /opt/homebrew/opt/asdf/libexec/asdf.sh
fi
