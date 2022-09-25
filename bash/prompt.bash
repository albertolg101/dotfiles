ATTRIBUTE_RESET='\[\e[0m\]'
ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_ITALIC='\[\e[3m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_LIGHT_RED='\[\e[91m\]'
COLOR_LIGHT_GREEN='\[\e[92m\]'
COLOR_LIGHT_YELLOW='\[\e[93m\]'
COLOR_LIGHT_BLUE='\[\e[94m\]'
COLOR_LIGHT_MAGENTA='\[\e[95m\]'
COLOR_LIGHT_CYAN='\[\e[96m\]'
COLOR_WHITE='\[\e[97m\]'

COLOR_OCHRE="\033[38;5;95m"
COLOR_GRAY='\e[38;5;246m'

PROMPT_DIRTRIM=3
PROMPT_COMMAND=prompt_command

user_symbol() {
    if [[ $EUID -eq 0 ]]; then
        echo '#'
    else
        echo '$'
    fi
}

machine_name() {
    if [ -f $HOME/.name ]; then
        cat $HOME/.name
    else
        hostname
    fi
}

git_color() {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_LIGHT_GREEN
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_LIGHT_YELLOW
  elif [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_LIGHT_RED
  else
    echo -e $COLOR_LIGHT_OCHRE
  fi
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "($venv) "
}

command_status() {
    if [[ $1 -ne 0 ]]; then
        echo "${COLOR_LIGHT_RED}"
    else
        echo "${COLOR_LIGHT_BLUE}"
    fi
}

prompt_command() {
    local exit_code="$?"

    PS1=""
    PS1+="\n$(command_status ${exit_code})$(user_symbol)${COLOR_WHITE} "
    PS1+="$(virtualenv_info)"
    PS1+="${COLOR_LIGHT_GREEN}\\u${COLOR_WHITE}"
    PS1+="${COLOR_LIGHT_GREEN}@${COLOR_WHITE}"
    PS1+="${COLOR_LIGHT_GREEN}\$(machine_name)${COLOR_WHITE}"
    PS1+="${COLOR_LIGHT_WHITE}:${COLOR_WHITE}"
    PS1+="${COLOR_LIGHT_CYAN}\w${COLOR_WHITE}"
    PS1+=" $(git_color)$(parse_git_branch)${COLOR_WHITE}"
    PS1+="\n${COLOR_LIGHT_BLUE}>${COLOR_WHITE} "
    PS2="$(command_status) "
}

demoprompt() {
    PROMPT_DIRTRIM=1
    PS1="${COLOR_LIGHT_GRAY}\w ${COLOR_LIGHT_BLUE}\$ "
    trap '[[ -t 1 ]] && tput sgr0' DEBUG
}
