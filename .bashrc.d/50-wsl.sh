if [[ "${INSIDE_WSL}" ]]; then
    WSL_HOST="$(ip route show default | cut -d' ' -f3)"

    # Docker Desktop support
    export DOCKER_HOST="${WSL_HOST}:2375"

    # Xvcsrv support
    export DISPLAY="${WSL_HOST}:0"
    export LIBGL_ALWAYS_INDIRECT=1

    # Native OpenSSH support
    if [[ -f /mnt/c/opt/bin/npiperelay.exe ]] ; then
        chmod +x /mnt/c/opt/bin/npiperelay.exe
        export SSH_AUTH_SOCK=$HOME/.local/ssh-agent.sock
        ss -a | grep -q $SSH_AUTH_SOCK
        if [[ $? != 0 ]] ; then
            rm -f $SSH_AUTH_SOCK
            ( setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"/mnt/c/opt/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & ) &>>/tmp/ssh-agent-pipe-relay.log
        fi
    fi
fi

true
