#/bin/sh
cd pack/mypackage/start
pwd
cat ../../../repos.txt | xargs -i git clone https://github.com/takubo/{}
