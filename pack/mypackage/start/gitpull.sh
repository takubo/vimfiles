#/bin/sh
cat repos.txt | xargs -i sh -c 'cd {}; basename `pwd`; git pull;'
