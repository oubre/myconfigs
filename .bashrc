# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Requirement for npm
. /opt/rh/devtoolset-2/enable

# Requirement for usability
set -o vi

# For make_release job
export RELEASE_DIRECTORY=/web/soubre01.alchemy-eng.com/releases/
export STATIC_URL=soubre01.alchemy-eng.com

# User specific aliases and functions
alias 11='cd /web/soubre11.alchemy-eng.com/'
alias 01='cd /web/soubre01.alchemy-eng.com/'
alias 21='cd /web/soubre21.alchemy-eng.com/'
alias tm='tmux a -t'

#relative links
sw() {
    regex="^/web/${USER}[012][0-9]\.alchemy-eng\.com"
    currdir=`pwd`
    suffix=''

    if [[ $2 ]]; then
        cd "/web/${USER}${1}.alchemy-eng.com/"
        eval ${2};
    elif [[ $currdir =~ $regex ]]; then
        suffix=`echo $currdir | cut --delimiter='/' --fields=4-99`  
        sbdir="/web/${USER}${1}.alchemy-eng.com/$suffix"
        cd $sbdir
    else
        cd "/web/${USER}${1}.alchemy-eng.com/"
    fi
}

root() {
    rootDir=`pwd | cut -d "/" -f1-3`
    cd ${rootDir}/git/manager
}
myClients() {
    rootDir=`pwd | cut -d "/" -f1-3`
    cd ${rootDir}/public/clients
}
acctests() {
    rootDir=`pwd | cut -d "/" -f1-3`
    cd ${rootDir}/git/manager/www/tests/codeception2/tests/acceptance
}
cest() {
    rootDir=`pwd | cut -d "/" -f1-3`
    cd ${rootDir}/git/manager/www/tests/codeception2
}
myBin() {
    rootDir=`pwd | cut -d "/" -f1-3`
    cd ${rootDir}/git/manager/library/bin
}

#Helper methods
add-key() {
    eval `ssh-agent`
    ssh-add
}

devUpdate() {
	git fetch upstream
	git checkout development
	git rebase
    git status
	./dev_setup
    git checkout ../../www/js/npm-shrinkwrap.json
}

branchUpdate() {
	git fetch upstream
	git rebase
    git status
	./dev_setup
    git checkout ../../www/js/npm-shrinkwrap.json
}

codesnifffix() {
	public/api/vendor/bin/phpcbf $1 
}

codesniff() {
	public/api/vendor/bin/phpcs $1 
}

alias codecept='../../public/api/vendor/bin/codecept'

buildCest() {
	../../public/api/vendor/bin/codecept build
}

runCest() {
	../../public/api/vendor/bin/codecept run --debug "$@"
}

runAcc() {
	../../public/api/vendor/bin/codecept run acceptance --debug --skip-group deprecated --skip-group incomplete --skip-group flaky "$@"
}

goToClient() {
    rootDir=`pwd | cut -d "/" -f1-3`
    cd ${rootDir}/public/clients/$1
}

clientDB() {
    rootDir=`pwd | cut -d "/" -f1-3`
    cd ${rootDir}/public/clients/$1
    cidb
}
