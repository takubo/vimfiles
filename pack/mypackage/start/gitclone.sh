#/bin/sh
cat repos.txt | xargs -i git clone https://github.com/takubo/{}
