if [ -f "${HOME}/.local/n/bin/npm" ] ; then
        export N_PREFIX="${HOME}/.local/n"
        export PATH="${N_PREFIX}/bin:${PATH}"
fi
