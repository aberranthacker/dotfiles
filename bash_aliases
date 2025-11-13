# vi: ft=bash

if [ -f /bin/eza ]; then
    # A modern, maintained replacement for ls.
    # https://github.com/eza-community/eza
    alias ls='eza'
    # -F, --classify -- append indicator (one of */=>@|) to entries
    alias l='ls -F'
else
    alias ls='ls --color=auto'
    # -C -- list entries by columns
    # -F, --classify -- append indicator (one of */=>@|) to entries
    alias l='ls -CF'
fi
# -a, --all       do not ignore entries starting with .
# -l              use a long listing format
# -b, --binary    list file sizes with binary prefixes
# -F, --classify  append indicator (one of */=>@|) to entries
alias ll='ls -albF'

alias lg='lazygit'

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gco='git co'
alias gpu='git push'
alias gst='git st'
alias gr='git rebase'
alias kf='killall -9 firefox'
alias please='sudo'
alias rg='clear; rg --smart-case'
alias spotify='spotify --force-device-scale-factor=2'
alias tns='trans -pager more --'

alias vim='nvim'

alias erb='erb -U'

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
alias rake='_rake_command'

function _rails_command () {
    if [ -e "bin/rails" ]; then
        bin/rails "$@"
    else
        command rails "$@"
    fi
}
alias rails='_rails_command'

if [ "$(uname)" == "Darwin" ]; then
    # Do something under sh(i)tOS X platform
    alias vim='/usr/local/bin/vim'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    alias open='xdg-open'
    # Add an "alert" alias for long running commands.  Use like so:
    #   sleep 10; alert
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
    alias disable-touchpad='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 0'
    alias enable-touchpad='xinput set-prop `xinput list | grep -i touchpad | cut -f 2 | grep -oE '[[:digit:]]+'` "Device Enabled" 1'
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
