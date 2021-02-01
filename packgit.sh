#/bin/sh
cd pack/mypackage/start
pwd
cat ../../../repos.txt | grep -v '^#' | xargs -i sh -c 'echo ; cd {}; basename `pwd`; git '"${1:-st};"
