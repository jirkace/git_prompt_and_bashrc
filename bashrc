case "$(uname)" in
	Linux) PLATFORM='linux';;
	Darwin) PLATFORM='osx';;
	*) PLATFORM='unknown';;
esac

export PATH=~/bin:$PATH
if [[ -d ${HOME}/Library/Developer/Xcode/usr/bin ]]; then
        PATH="${HOME}/Library/Developer/Xcode/usr/bin:${PATH}"
fi

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend # append to the history file, don't overwrite it
HISTCONTROL=ignoredups:ignorespace # append to history, don't overwrite it

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# FUNCTIONS
function mkcd
{
	mkdir "$1" && cd "$1"
}

if [ "$(which kinit)" != "" ]; then
function sshk
{
	klist -s
	if [ "$?" != "0" ]; then
		echo TGT expired! Creating new one.
		kinit -r 7d jiri.cerny
#$(whoami)
	fi
	ssh jiri.cerny@$1.ls.intra "$2"
	#"cat /etc/motd ; sudo -i"
}
function scpk
{
	klist -s
	if [ "$?" != "0" ]; then
		echo TGT expired! Creating new one.
		kinit -r 7d jiri.cerny
#$(whoami)
	fi
	scp $1 jiri.cerny@$(echo $2 | sed -e "s/://g").ls.intra:
}
fi

function php-cli-debug-start
{
	export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1 remote_connect_back=0"
#	php -dxdebug.remote_enable=1 -dxdebug.remote_mode=req -dxdebug.remote_port=9000 -dxdebug.remote_host=127.0.0.1 -dxdebug.remote_connect_back=0 $1
}

function php-cli-debug-stop
{
	export XDEBUG_CONFIG=""
}

# ALIASES
if [ -x /usr/bin/dircolors ]; then
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi
alias l='ls -lah'


unset PLATFORM

# GIT bash prompt
if [ -f $(dirname $BASH_SOURCE)/git_prompt ]; then
	. $(dirname $BASH_SOURCE)/git_prompt
	export PROMPT_COMMAND="create_prompt"
	#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }create_prompt"
fi

# Save and reload the history after each command finishes
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

if [ "$TERM_PROGRAM" == "vscode" ]; then
	export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"';
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

source $(dirname $BASH_SOURCE)/bashrc_tweaks
source $(dirname $BASH_SOURCE)/.kubectl_aliases
source $(dirname $BASH_SOURCE)/.bash_aliases
