if awk '{print $3}' /proc/mounts | grep -q drvfs; then
    export INSIDE_WSL=1
fi

true
