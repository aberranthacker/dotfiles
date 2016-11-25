# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias tmux='TERM=xterm-256color /usr/bin/tmux'
alias mocp='PULSE_LATENCY_MSEC=30 mocp'
alias ts='tmuxinator start'

function _guard_command () {
    if [ -e "bin/guard" ]; then
        bin/guard "$@"
    else
        command guard "$@"
    fi
}
alias guard='_guard_command'

function _rake_command () {
    if [ -e "bin/guard" ]; then
        bin/rake "$@"
    else
        command rake "$@"
    fi
}
alias guard='_rake_command'
