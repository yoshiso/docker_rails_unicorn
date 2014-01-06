#!/bin/bash
#Install Ruby by rubyenv

if [ ! -d /usr/local/rbenv ];then
    cd /usr/local
    git clone git://github.com/sstephenson/rbenv.git rbenv
    mkdir rbenv/shims rbenv/versions
    chgrp -R yoshiso rbenv
    chmod -R g+rwxXs rbenv
    git clone git://github.com/sstephenson/ruby-build.git ruby-build
    cd ruby-build
    ./install.sh
    /usr/local/rbenv/bin/rbenv install 2.0.0-p353 # rubyをインストール
    /usr/local/rbenv/bin/rbenv global 2.0.0-p353 # 標準で使用するrubyのバージョンを指定
    echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
fi

#Install Node.js for Rails javascript runtime

if [ ! -d /usr/local/nvm ];then
    git clone https://github.com/creationix/nvm.git ~/.nvm
    source ~/.nvm/nvm.sh
    nvm install 0.10.24
    echo 'source /usr/local/nvm/nvm.sh' >> /etc/profile.d/nvm.sh
    echo 'nvm use v0.10.24' >> /etc/profile.d/nvm.sh
fi