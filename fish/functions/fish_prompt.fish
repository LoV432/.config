function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    printf '\n'
    printf '> '
    set_color -i red
    printf L
    set_color brred
    printf o
    set_color yellow
    printf V
    set_color green
    printf 4
    set_color blue
    printf 3
    set_color purple
    printf 2
    set_color normal
    printf ' <'
    printf ' @ '

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal

    # Line 2
    echo
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end
