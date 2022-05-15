if awk '{print $1}' /proc/mounts | grep -q 'C:\\'; then
    export INSIDE_WSL=1
fi

true
