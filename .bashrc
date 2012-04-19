# Colors (http://chakra-linux.org/wiki/index.php/Color_Bash_Prompt)
txtrst='\e[0m'    # Text Reset
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White


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


# Add MacPorts path
if [[ $platform == 'darwin' && "$(type -P /opt/local/bin/port)" ]]; then
   PATH=/opt/local/bin:/opt/local/sbin:$PATH
fi


# Set up aliases
alias psg='ps -ax | grep $1'
alias ot='popd'
alias to='pushd'
alias l='ls -CF'
alias ls='ls -lFb'
alias la='ls -lFbAp'
alias lc='ls -FbC'


# Set the terminal to use color
if [[ $platform == 'darwin' ]]; then
   export CLICOLOR=1
   export LSCOLORS=ExFxCxDxBxegedabagacad
elif [[ $platform == 'linux' ]]; then
   # We have to redefine aliases that need color
   alias l='ls -CF --color=auto'
   alias ls='ls -lFb --color=auto'
   alias la='ls -lFbAp --color=auto'
   alias lc='ls -lFbc --color-auto'
fi

# Set the prompt
if [[ "$(id -u)" != "0" ]]; then
   if [[ "$(type -P vcprompt)" ]]; then
      PS1="${txtylw}\w "'$(vcprompt)'"${txtrst}$ "
   else
      PS1="${txtylw}\w ${txtrst}$ "
   fi
fi


# Completion
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

