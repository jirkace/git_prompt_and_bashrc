###############################

############  BLACKIE #########
###############################

alias ..='cd ..'
alias ...='cd ../..'

alias e='exit'
alias s='sudo'
alias susp='sudo pm-suspend'

alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agu='sudo apt-get update && sudo apt-get upgrade'
alias aupgr='sudo apt-get dist-upgrade'
alias acs='apt-cache search'

alias gti='git'
alias gut='git'
alias la='ls -alh'

alias cdf='cd /w/flashscore'
alias cdww='cd /w/'


alias zkrat='cat /w/git_prompt_and_bashrc/.bash_aliases | grep alias'
alias editzkrat='mcedit /w/git_prompt_and_bashrc/.bash_aliases'
alias audit='git audit -riu "$(git config user.name)"'


alias lskinit='op --account "livesport.1password.eu" read "op://Private/LDAP/password" | /usr/bin/kinit -r 7d jiri.cerny'

alias a='eval $(ssh-agent) ; ssh-add ~/.ssh/id_rsa'

alias tailf='tail -f'

alias pbpaste='xclip -selection clipboard -o'

