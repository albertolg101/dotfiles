# Set virtualenvwrapper
if [ -f ~/.local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/.config/virtualenvs
    export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
    source ~/.local/bin/virtualenvwrapper.sh
fi

export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'batcat --color=always --style=header,grid --line-range :300 {}'"
