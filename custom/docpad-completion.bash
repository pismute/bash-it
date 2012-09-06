#
#  Completion for foo:
#
#  foo file [filename]
#  foo hostname [hostname]
#
_docpad(){
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"

    case "${cur}" in
        -*)
            _docpad_options
            ;;
        *)
            _docpad_cmd
            ;;
    esac
}

_docpad_cmd() 
{
    local cur prev opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="run server skeleton render generate watch install clean info help"

    case "${prev}" in
        docpad)
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            ;;
        *)
            COMPREPLY=( $(compgen -f ${cur}) )
            ;;
    esac
}

_docpad_options() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="--help --version --out --config --env --debug --force"

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}

complete -F _docpad docpad

