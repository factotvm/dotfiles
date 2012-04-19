# Set patform depending on OS
platform='unknown'
if [[ $OSTYPE == darwin* ]]; then
    platform='darwin'
elif [[ $OSTYPE == linux* ]]; then
   platform='linux'
fi


# Add the ~ bin
PATH=$HOME/bin:$PATH


# Add .rvm bin
PATH=$PATH:$HOME/.rvm/bin


# Set up aliases
alias psx='ps -auxw | grep $1'
alias ot='popd'
alias to='pushd'
alias l='ls -CF'
alias ls='ls -lFb'
alias la='ls -lFbAp'
alias lc='ls -lFbc'


# Set the terminal to use color
if [[ $platform == 'darwin' ]]; then
   export CLICOLOR=0
   export LSCOLORS=ExFxCxDxBxegedabagacad
elif [[ $platform == 'linux' ]]; then
   # We have to redefine aliases that need color
   alias l='ls -CF --color=auto'
   alias ls='ls -lFb --color=auto'
   alias la='ls -lFbAp --color=auto'
   alias lc='ls -lFbc --color-auto'
fi
