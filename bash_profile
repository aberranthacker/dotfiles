# .bash_profile is executed to configure your shell
# before the initial command prompt.

# User specific environment and startup programs
export EDITOR='vim'
export PATH=$PATH:$HOME/.bin:$HOME/bin:$HOME/.local/bin:/usr/local/heroku/bin

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
