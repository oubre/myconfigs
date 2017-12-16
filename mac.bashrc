# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

rootDir='/Users/soubre/manager/manager'

# User specific aliases and functions
alias www="${rootDir}/www"

#relative links
myClients() {
    cd ${rootDir}/public/clients
}
acctests() {
    cd ${rootDir}/www/tests/codeception2/tests/acceptance
}
cest() {
    cd ${rootDir}/www/tests/codeception2
}
myBin() {
    cd ${rootDir}/library/bin
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
