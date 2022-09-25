path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

here() {
    local loc="$(cd "$(dirname -- "$1")" >/dev/null; pwd)"
    if [ $# -ne 0 ] && [ -d $1 ] && [ $1 != "." ]; then
        loc="$loc/$(basename -- $1)"
    fi
    ln -sfn "${loc}" "$HOME/.config/.shell.here"
    echo "here -> $loc $HOME/.config/.shell.here"
}

there="$HOME/.config/.shell.here"

there() {
    cd "$(readlink "${there}")"
}
