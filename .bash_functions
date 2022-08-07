# Required: fzf, xtools
xs () {
    xpkg -a |
        fzf -m --preview 'xq {1}' \
            --preview-window=right:66%:wrap |
        xargs -ro xi
}

# Required: {m,p}locate, ictree
iclocate () {
    if [[ $1 = "" ]] || [[ $2 != "" ]]; then
        echo "Use at least one argument and no more than one"
    else
        echo "Updating database..."
        sudo updatedb
        locate $1 | ictree
    fi
}

