if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    zoxide init --cmd cd fish | source

    alias vim="nvim"
    alias ip="ip -c"

    alias ls="exa --icons"
    alias ll="ls -l"
    alias la="ls -a"
    alias lla="ll -a"
    alias tree="ls --tree"

    alias cat="bat"
end

export $(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

# Created by `pipx` on 2023-10-28 23:45:23
set PATH $PATH /home/albertolg101/.local/bin
