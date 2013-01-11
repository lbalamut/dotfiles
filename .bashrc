# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#                 _                                      _
#  ___ _ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_
# / _ \ '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
#|  __/ | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_
# \___|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|

export EDITOR="/opt/local/bin/mvim"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"

export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.4.2.2/jars"
export EC2_URL=https://ec2.eu-west-1.amazonaws.com

#directories aliases
CDPATH='.:..:../..:~:~/work:~/work/nokia'

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$HOME/scripts/nokia:$PATH"
fi

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# export MANPATH="$MANPATH"

export LC_CTYPE="en_GB.UTF-8"
export LC_ALL="C"

#             _   _
#  ___  _ __ | |_(_) ___  _ __  ___
# / _ \| '_ \| __| |/ _ \| '_ \/ __|
#| (_) | |_) | |_| | (_) | | | \__ \
# \___/| .__/ \__|_|\___/|_| |_|___/
#      |_|
# Wrap lines correctly after resizing them
#shopt -s checkwinsize

# Fix typos when changing into directories
shopt -s cdspell

# Check a command is in the hash table before executing it
shopt -s checkhash

# Don't waste time completing when line is empty
shopt -s no_empty_cmd_completion

# Expand filenames beginning with period
shopt -s dotglob

# globstar doesn't exist in bash 3.2
if [ ${BASH_VERSINFO[0]} -gt 4 ]; then
    # Set recursive globbing with **
    shopt -s globstar
fi

# No new mail notifications
shopt -u mailwarn
unset MAILCHECK

# let's you do things like
# export s=/etc
# cd s
shopt -s cdable_vars

# Use vi keybindings
# set -o vi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#
set cmdhist

# _     _     _
#| |__ (_)___| |_ ___  _ __ _   _
#| '_ \| / __| __/ _ \| '__| | | |
#| | | | \__ \ || (_) | |  | |_| |
#|_| |_|_|___/\__\___/|_|   \__, |
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=1000000
export HISTFILESIZE=$HISTSIZE
# export HISTIGNORE="&":"[ ]*":exit:ll:la:l:pwd:df

# append to the history file, don't overwrite it
shopt -s histappend

#       _ _
#  __ _| (_) __ _ ___  ___  ___
# / _` | | |/ _` / __|/ _ \/ __|
#| (_| | | | (_| \__ \  __/\__ \
# \__,_|_|_|\__,_|___/\___||___/
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -Fa'
alias ld='ls -al -d * | egrep "^d"' # only subdirectories
alias lt='ls -alt | head -20' # recently changed files

alias md='mkdir -p'

alias tree='tree -Csu'
alias du='du -h -d 1'

alias vi='mvim --remote-tab-silent'
alias sit='mvn clean install -Pintegration-test,cdc-test,acceptance-test'
alias mci='mvn clean install'
alias mcits='mvn clean install -Dmaven.test.skip=true'

alias openports='netstat -nape --inet'
alias mvnDebug="export MAVEN_OPTS=$MAVEN_OPTS $MAVEN_DEBUG_OPTS"

alias mount_nas="sudo mount_nfs -o resvport,soft,intr,rsize=8192,wsize=8192,timeo=900,retrans=3  nas:/volume1/video  /Volumes/nas/video/"

alias mkdir-date="mkdir $(date +%Y-%m-%d_%H.%M.%S)"

# enable color support of ls and also add handy aliases
if [ -x /opt/local/bin/gdircolors ]; then
    eval "`gdircolors --bourne-shell ~/.dir_colors`"
    alias ls='gls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

title() {
  echo -n -e "\033]0;$1\007"
}
export -f title

alias serve="python -c \"import SimpleHTTPServer; m = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map; m[''] = 'text/plain'; m.update(dict([(k, v + ';charset=UTF-8') for k, v in m.items()])); SimpleHTTPServer.test();\""

#  __                  _   _
# / _|_   _ _ __   ___| |_(_) ___  _ __  ___
#| |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
#|  _| |_| | | | | (__| |_| | (_) | | | \__ \
#|_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
function jc {
    jmx_host=$1
    jmx_port=${2:-5000}
    proxy_host=${3:-$jmx_host}
    proxy_port=${4:-8123}

    echo "connecting jconsole to $jmx_host:$jmx_port via SOCKS proxy $proxy_host using local port $proxy_port"
    ssh -f -ND $proxy_port $proxy_host
    jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=${proxy_port} service:jmx:rmi:///jndi/rmi://${jmx_host}:${jmx_port}/jmxrmi
    kill $(ps ax | grep "[s]sh -f -ND $proxy_port" | awk '{print $1}')
}
export -f jc

function jvvm {
    jmx_host=$1
    jmx_port=${2:-5000}
    proxy_host=${3:-$jmx_host}
    proxy_port=${4:-8123}

    echo "connecting jvisualvm to $jmx_host:$jmx_port via SOCKS proxy $proxy_host using local port $proxy_port"
    ssh -f -ND $proxy_port $proxy_host
    jvisualvm -J-Dnetbeans.system_socks_proxy=localhost:${proxy_port} -J-Djava.net.useSystemProxies=true --openjmx  service:jmx:rmi:///jndi/rmi://${jmx_host}:${jmx_port}/jmxrmi
    kill $(ps ax | grep "[s]sh -f -ND $proxy_port" | awk '{print $1}')
}
export -f jvvm

# Makes extraction easier
function extract() {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
export -f extract

# Nice shortcut for finding files and executing commands on them
# E.g. `fe pyc rm`
function fe() {
  find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ;
}
export -f fe

function git-file-hist() {
    case $1 in
        "-p") git log -w --follow -p "$2" ;;
        *)    git log -w --follow "$1" ;;
    esac
}

function git-word-hist() {
    case $1 in
        "-p") git log -w -p -S "$2" ;;
        *)    git log -w -S "$1" ;;
    esac
}
#                           _      _   _ _   _
#  ___ ___  _ __ ___  _ __ | | ___| |_(_) |_(_) ___  _ __
# / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __| | __| |/ _ \| '_ \
#| (_| (_) | | | | | | |_) | |  __/ |_| | |_| | (_) | | | |
# \___\___/|_| |_| |_| .__/|_|\___|\__|_|\__|_|\___/|_| |_|
#                    |_|
# General, http://bash-completion.alioth.debian.org/
# Homebrew, https://github.com/mxcl/homebrew/raw/master/Library/Contributions/brew_bash_completion.sh
# Git, https://github.com/git/git/raw/master/contrib/completion/git-completion.bash

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
   source /opt/local/etc/profile.d/bash_completion.sh
fi

complete -A user su mail finger

# Compression autcompletions
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip tar
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
complete -f -o default -X '!*.+(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extract

# For these languages, only complete with corresponding filenames
complete -f -X '!*.py' python
complete -f -X '!*.rb' ruby
complete -f -X '!*.pl' perl

#                                 _
# _ __  _ __ ___  _ __ ___  _ __ | |_
#| '_ \| '__/ _ \| '_ ` _ \| '_ \| __|
#| |_) | | | (_) | | | | | | |_) | |_
#| .__/|_|  \___/|_| |_| |_| .__/ \__|
#|_|                       |_|
# Only use git prompt if git bash completion is installed.
if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
    source /opt/local/share/git-core/git-prompt.sh

    export GIT_PS1_SHOWDIRTYSTATE="true"
    export GIT_PS1_SHOWSTASHSTATE="true"
    export GIT_PS1_SHOWUNTRACKEDFILES="true"
    export GIT_PS1_SHOWUPSTREAM="verbose"

    PS1='\[\033[32m\]\h\[\033[00m\]:\[\033[36m\]\w\[\033[00m\]\[\033[33m\]$(__git_ps1)\[\033[00m\]: '
fi

PROMPT_COMMAND="history -a"

# _ __  _ __ _____  ___   _
#| '_ \| '__/ _ \ \/ / | | |
#| |_) | | | (_) >  <| |_| |
#| .__/|_|  \___/_/\_\\__, |
#|_|                  |___/
function no_proxy() {
    export http_proxy=
    export https_proxy=
    export ftp_proxy=
    export HTTPS_PROXY=
    export HTTP_PROXY=
    export FTP_PROXY=
}

function nokia_proxy() {
    export http_proxy=nokes.nokia.com:8080
    export https_proxy=nokes.nokia.com:8080
    export ftp_proxy=nokes.nokia.com:8080
    export HTTPS_PROXY=nokes.nokia.com:8080
    export HTTP_PROXY=nokes.nokia.com:8080
    export FTP_PROXY=nokes.nokia.com:8080
}
#            _
# _ __ _   _| |__  _   _
#| '__| | | | '_ \| | | |
#| |  | |_| | |_) | |_| |
#|_|   \__,_|_.__/ \__, |
#                  |___/
#rvm lazy instantiation
function rvm-init() {
   export PATH=$HOME/.rvm/bin:$PATH
   [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm";
}
