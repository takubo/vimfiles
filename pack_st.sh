#/bin/sh
cd pack/mypackage/start
pwd
cat ../../../repos.txt | xargs -i sh -c 'cd {}; basename `pwd`; git st;'
