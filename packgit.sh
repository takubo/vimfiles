#/bin/sh
cd pack/mypackage/start
pwd
cat ../../../repos.txt | xargs -i sh -c 'echo ; cd {}; basename `pwd`; git '"${1:-st};"
