n()
{
    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, export NNN_TMPFILE after the call to nnn
    export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd

    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm $NNN_TMPFILE
    fi
}
