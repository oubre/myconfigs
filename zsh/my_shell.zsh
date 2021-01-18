# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

bindkey -v

rootDir=~/github/manager

alias cept='../../public/api/vendor/bin/codecept'

www () {
  cd $rootDir/www
}

myClients () {
    cd $rootDir/www/data/clients
}
acc() {
    cd $rootDir/www/tests/codeception2/tests/acceptance
}
cest() {
    cd $rootDir/www/tests/codeception2
}
myBin() {
    cd $rootDir/library/bin
}

#Helper methods
add-key() {
    eval `ssh-agent`
    ssh-add
}

runAcc() {
	../../public/api/vendor/bin/codecept run acceptance --debug --skip-group deprecated --skip-group incomplete --skip-group flaky "$@"
}

goToClient() {
    cd $rootDir/www/data/clients/$1
}

clientDB() {
    cd $rootDir/www/data/clients/$1
    cidb
}
