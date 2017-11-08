bold='\033[1m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[1;33m'
blue='\033[0;34m'
cyan='\033[0;36m'
white='\033[1;37m'
reset='\033[0m'
##
## printfcolor ${red} "... text "
##
printfcolor () {
    printf "${1}${2}${reset}\n"
}

exitWithError () {
    printf "${red}${1}${reset}\n"
    exit 1;
}

##
## runCmd "ls"
##
runCmd () {
    local cmd=$1
    printfcolor ${cyan} "running: $cmd"
    ${cmd}
    if [ "$?" -ne 0 ]; then
        exitWithError "failed to run:${cmd}"
    fi
}
