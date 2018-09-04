# some more ls aliases
# Exa is an alternative for the ls command.
# sudo dnf copr enable eclipseo/exa
# sudo dnf install exa
alias ls='exa'
# -a, --all -- do not ignore entries starting with .
# -l -- use a long listing format
# -F, --classify -- append indicator (one of */=>@|) to entries
alias ll='ls -alF'
# -A, --almost-all -- do not list implied . and ..
#alias la='ls -A'
alias la='ls -a'
# -C -- list entries by columns
# -F, --classify -- append indicator (one of */=>@|) to entries
alias l='ls -CF'

alias rg='rg --smart-case'
alias spotify='spotify --force-device-scale-factor=2'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ts='tmuxinator start'
alias tns='trans -pager more --'
alias csd='cap staging deploy'
alias csr='cap staging puma:restart'
alias gpu='git push'

function _guard_command () {
    if [ -e "bin/guard" ]; then
        bin/guard "$@"
    else
        command guard "$@"
    fi
}
# alias guard='_guard_command'

function _rake_command () {
    if [ -e "bin/guard" ]; then
        bin/rake "$@"
    else
        command rake "$@"
    fi
}
# alias rake='_rake_command'
