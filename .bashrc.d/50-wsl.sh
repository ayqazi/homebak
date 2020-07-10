if [[ "${INSIDE_WSL}" ]]; then

    # Docker Desktop support
    export DOCKER_HOST=localhost:2375

    # Xvcsrv support
    export DISPLAY=:0
    export LIBGL_ALWAYS_INDIRECT=1

    # Native OpenSSH support
    if [[ -f /mnt/c/opt/ssh-agent-wsl/ssh-agent-wsl && -x /mnt/c/opt/ssh-agent-wsl/ssh-agent-wsl ]] ; then
        chmod +x /mnt/c/opt/ssh-agent-wsl/ssh-agent-wsl /mnt/c/opt/ssh-agent-wsl/pipe-connector.exe
        eval "$(/mnt/c/opt/ssh-agent-wsl/ssh-agent-wsl -rqa ~/.local/.ssh-agent-auth-sock-$(id -u))"
    fi
fi

true
