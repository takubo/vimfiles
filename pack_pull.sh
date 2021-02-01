#/bin/sh
cd pack/mypackage/start
pwd
cat ../../../repos.txt | grep -v '^#' | xargs -i sh -c 'cd {}; basename `pwd`; git pull;'
