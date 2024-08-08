###############################

############  BLACKIE #########
###############################

alias docs='cd ~/Dokumenty'
alias down='cd ~/Stazene'
alias desktop='cd ~/Plocha'
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
alias la='ls -alh'

alias cdf='cd /w/flashscore'
alias cdd='cd /w/datacore'
alias cdww='cd /w/'

alias compi='cd /w/flashscore && php composer.phar install'
alias compu='cd /w/flashscore && php composer.phar update'

alias d1000='/w/dfsc/dfsc.sh -i 1:0:0:0 restart'
alias d1100='/w/dfsc/dfsc.sh -i 1:1:0:0 restart'
alias d1110='/w/dfsc/dfsc.sh -i 1:1:1:0 restart'
alias d1111='/w/dfsc/dfsc.sh -i 1:1:1:1 restart'
alias d1001='/w/dfsc/dfsc.sh -i 1:0:0:1 restart'

alias d1000e='/w/dfsc/dfsc.sh -e -i 1:0:0:0 restart'
alias d1100e='/w/dfsc/dfsc.sh -e -i 1:1:0:0 restart'
alias d1110e='/w/dfsc/dfsc.sh -e -i 1:1:1:0 restart'
alias d1111e='/w/dfsc/dfsc.sh -e -i 1:1:1:1 restart'
alias d1001e='/w/dfsc/dfsc.sh -e -i 1:0:0:1 restart'

alias d1000z='/w/dfsc/dfsc.sh -z -i 1:0:0:0 restart'
alias d1100z='/w/dfsc/dfsc.sh -z -i 1:1:0:0 restart'
alias d1110z='/w/dfsc/dfsc.sh -z -i 1:1:1:0 restart'
alias d1111z='/w/dfsc/dfsc.sh -z -i 1:1:1:1 restart'
alias d1001z='/w/dfsc/dfsc.sh -z -i 1:0:0:1 restart'


alias d0000='/w/dfsc/dfsc.sh stop'

alias storm='/opt/phpstorm/bin/phpstorm.sh > /dev/null &'
alias beans='/home/blackie/netbeans-8.0.2/bin/netbeans > /dev/null &'

alias zkrat='cat ~/.bash_liases | grep alias'
alias editzkrat='vim ~/.bash_aliases'
alias audit='git audit -riu "$(git config user.name)"'

alias sshoffice='nmcli con up id Office & ssh blackie@blackie -i /home/blackie/.ssh/id_rsa'
alias sshcheef='ssh root@vps2.cheef.cz -i /home/blackie/.ssh/cheef_id_rsa'
alias lsvpn='nmcli con up id Office'

alias fless='/w/flashscore/www/res/less-compile.sh'
alias fcoffee='/w/flashscore/www/res/script/coffee/coffee-compile.sh'


alias mochatest='mocha --ui tdd'


alias pulnoc='sudo date +%T -s "23:59:00"'
alias au10noc='sudo date -s "15 Oct 2015 14:31:00"'

alias aspira='vlc http://obelix.srv.lsoffice.cz:8090/aspira.mpg'
alias punit='phpunit --testsuite unit'
alias fstestw1='ssh jiri.cerny@fstestw1.edrive.intra -o StrictHostKeyChecking=no'
alias drcfs1='ssh root@drcfs1.srv.lsoffice.cz -o StrictHostKeyChecking=no'

alias nuv='flatpak run eu.tiliado.NuvolaAppGooglePlayMusic//master -D'



export KRB5_CONFIG=/home/jiri.cerny/.krb5.conf
export KRB5CCNAME=/home/jiri.cerny/.krb5.cache
#alias lskinit='/usr/bin/kinit -r 7d jiri.cerny'
alias lskinit='op --account "livesport.1password.eu" read "op://Private/LDAP/password" | /usr/bin/kinit -r 7d jiri.cerny'
alias lskinitop='op --account "livesport.1password.eu" item get --fields password LDAP | /usr/bin/kinit -r 7d jiri.cerny'
alias a='eval $(ssh-agent) ; ssh-add ~/.ssh/id_rsa'

alias tailf='tail -f'

alias rmmore='sudo rm -R www/res/script/module-read-only/react/test && sudo rm -R www/res/script/module-read-only/modules/cmp/test/'

alias fixlatte='rm -rf  cache/latte;git checkout cache;chmod 2775 cache/latte;./dfsc.sh restart'

alias psalm='php -dopcache.enable_cli=1 ./vendor/bin/psalm --config=.psalm/psalm.xml --threads=14 --output-format=console '

alias pbpaste='xclip -selection clipboard -o'

#alias okuber='kubectl --kubeconfig ~/.ssh/k8s-configs/config'
#alias okube='kubectl --kubeconfig ~/.ssh/k8s-configs/okube1'
#alias okube-fs='kubectl --kubeconfig ~/.ssh/k8s-configs/okubefs1'
#alias okube-fsglr='kubectl --kubeconfig ~/.ssh/k8s-configs/okubefsglr1'
#alias kube-fs='kubectl --kubeconfig ~/.ssh/k8s-configs/kubefs1'

###############################
###############################
