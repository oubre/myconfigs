# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Requirement for npm
. /opt/rh/devtoolset-2/enable

# User specific aliases and functions
alias 11='cd /web/soubre11.alchemy-eng.com/git/manager/www'
alias 01='cd /web/soubre01.alchemy-eng.com/git/manager/www'
alias 21='cd /web/soubre21.alchemy-eng.com/git/manager/www'

#relative links
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
devUpdate() {
	git fetch upstream
	git checkout development
	git rebase
    git status
	./dev_setup
}

branchUpdate() {
	git fetch upstream
	git rebase
    git status
	./dev_setup
}

codesnifffix() {
	public/api/vendor/bin/phpcbf $1 
}

codesniff() {
	public/api/vendor/bin/phpcs $1 
}

buildCest() {
	../../public/api/vendor/bin/codecept build
}

runCest() {
	../../public/api/vendor/bin/codecept run --debug "$@"
}

runAcc() {
	../../public/api/vendor/bin/codecept run --debug acceptance "$@"
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
