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

# Make Bash case-insensitive
bind "set completion-ignore-case on"


# Set patform depending on OS
platform='unknown'
if [[ $OSTYPE == darwin* ]]; then
    platform='darwin'
elif [[ $OSTYPE == linux* ]]; then
   platform='linux'
fi


# Add the ~ bin
PATH=$HOME/bin:$PATH


# Add /usr/local/bin
PATH=/usr/local/bin:$PATH


# Set up Homebrew (http://mxcl.github.com/homebrew/)
if [[ $platform == 'darwin' && "$(type -P brew)" ]]; then
    # Add bash completion
    if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
    fi
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
      PS1="\[$txtylw\]\w "'$(vcprompt)'"\[$txtrst\]$ \]"
   else
      PS1="\[$txtylw\]\w \[$txtrst\]$ \]"
   fi
fi


# Set the root of our dotfiles to the parent directory
# see http://stackoverflow.com/a/179231
pushd . > /dev/null
target="${BASH_SOURCE[0]}";
if ([ -h "${target}" ]) then
  while [ -h "${target}" ]; do
    cd $(dirname "$target");
    target=$(readlink "${target}");
  done
fi
cd $(dirname ${target})  && cd .. > /dev/null
root=$(pwd);
popd  > /dev/null


# Source all files in ./source
if [[ -d $root/source ]]; then
   for file in $root/source/*; do
      source "$file"
   done
fi


# Increase Maven's heap size
export MAVEN_OPTS=-Xmx512m

# Add Flash Player to the path
if [[ $platform == 'darwin' ]]; then
   FLASH_PLAYER='/Applications/Flash Player Debugger.app/Contents/MacOS'
   export PATH=$FLASH_PLAYER:$PATH
fi

