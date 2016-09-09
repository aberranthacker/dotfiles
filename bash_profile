# .bash_profile is executed to configure your shell
# before the initial command prompt.

# User specific environment and startup programs
export PATH=$HOME/bin:$PATH:/usr/local/heroku/bin

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

source ~/.profile

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
