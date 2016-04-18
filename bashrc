case "$(uname)" in
	Linux) PLATFORM='linux';;
	Darwin) PLATFORM='osx';;
	*) PLATFORM='unknown';;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

export PATH=~/bin:$PATH

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# FUNCTIONS
function mkcd
{
	mkdir $1 && cd $1
}

if [ "$(which kinit)" != "" ]; then
function sshk
{
	klist -s
	if [ "$?" != "0" ]; then
		echo TGT expired! Creating new one.
		kinit -r 7d $(whoami)
	fi
	ssh $1.ls.intra
}
function scpk
{
	klist -s
	if [ "$?" != "0" ]; then
		echo TGT expired! Creating new one.
		kinit -r 7d $(whoami)
	fi
	scp $1 $(echo $2 | sed -e "s/://g").ls.intra:
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

if [[ "$PLATFORM" == 'osx' ]]; then
	PATH="/opt/brew/opt/coreutils/libexec/gnubin:$PATH"
	MANPATH="/opt/brew/opt/coreutils/libexec/gnuman:$MANPATH"	

	export DEVELOPER_DIR="`xcode-select -print-path`"

	export PATH=/usr/pkg/bin:/usr/pkg/sbin:/opt/brew/bin:/opt/brew/sbin:$PATH
	export MANPATH=/usr/pkg/man:/opt/brew/share/man:$MANPATH
	#export C_INCLUDE_PATH=/opt/brew/include:$C_INCLUDE_PATH
	export LIBPATH=/opt/brew/

	export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"

	export DOCKER_HOST=tcp://localhost:4243

	# Colors for folders etc.
	export CLICOLOR=1; export LSCOLORS=ExGxFxDxCxegedabagfcec;

	# ALIASES
	alias sublime='open -a Sublime\ Text'

	# Bash completion
#	. /etc/bash_completion
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi

	# NVM
	source $(brew --prefix nvm)/nvm.sh
	export NVM_DIR=$(dirname $BASH_SOURCE)/../.nvm
	nvm use stable >/dev/null
	#$(nvm use stable &) >/dev/null 2>&1

	# DOCKER - boot2docker
	export DOCKER_HOST=tcp://:2375
fi

unset PLATFORM

# GIT bash prompt
if [ -f $(dirname $BASH_SOURCE)/git_prompt ]; then
	. $(dirname $BASH_SOURCE)/git_prompt
	#export PROMPT_COMMAND="create_prompt"
	export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }create_prompt"
fi

# function _update_ps1() { export PS1="$(/Users/celly/tmp/powerline-shell/powerline-shell.py $? 2> /dev/null)"; }
# if [ "$TERM" != "linux" ]; then
# 	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi

# Tell the terminal about the working directory at each prompt.
#if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
#	update_terminal_cwd() {
#		# Identify the directory using a "file:" scheme URL,
#		# including the host name to disambiguate local vs.
#		# remote connections. Percent-escape spaces.
#		local SEARCH=' '
#		local REPLACE='%20'
#		local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
#		printf '\e]7;%s\a' "$PWD_URL"
#	}
#	PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
#fi

#[[ -f ~/.nvm/nvm.sh ]] && source ~/.nvm/nvm.sh # This loads NVM
