FROM ansible/centos7-ansible
MAINTAINER Yamada, Yasuhiro <greengregson@gmail.com>
RUN rpm -ivh http://packages.groonga.org/centos/groonga-release-1.1.0-1.noarch.rpm && \
    yum makecache && \
    yum -y install git bzip2 gcc gcc-c++ make openssl-devel readline-devel zlib-devel groonga-devel && \
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    source ~/.bashrc && \
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
    rbenv install -v 2.3.1 && \
    rbenv rehash && \
    rbenv global 2.3.1 && \
    gem install milkode
