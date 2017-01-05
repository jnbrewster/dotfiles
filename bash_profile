source ~/.bash_aliases
source ~/.profile

export EDITOR=vim
export PS1="\[\e[34m\]\W\[\e[m\] \[\e[32m\]>\[\e[m\] """

function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '[\[\e[0;37;'"$ansi"';]'"$branch"'] '
    fi
}
function _prompt_command() {
    PS1="`_git_prompt`"'\[\e[34m\]\W\[\e[m\] \[\e[32m\]>\[\e[m\] '
}
PROMPT_COMMAND=_prompt_command

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi



