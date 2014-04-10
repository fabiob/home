# habilita cores no "ls"
export CLICOLOR=1

# ativa UTF-8 nos fontes do Ruby como padrão
export LC_CTYPE=en_US.UTF-8

# adaptação para Homebrew
export PATH=/usr/local/bin:$PATH

# EC2 tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"

# Oracle Instant Client
export DYLD_LIBRARY_PATH=/usr/lib/oracle/instantclient
#export DYLD_LIBRARY_PATH=/usr/lib/oracle/instantclient_10_2-i386
export ORACLE_HOME=/usr/lib/oracle/instantclient
export SQLPATH=/usr/lib/oracle/instantclient
export TNS_ADMIN=/usr/lib/oracle/network/admin
export NLS_LANG=AMERICAN_AMERICA.UTF8
export PATH=$PATH:/usr/lib/oracle/instantclient

# MySQL
export MYSQL_HOME=/usr/local/mysql-x86_64
export PATH=$PATH:$MYSQL_HOME/bin
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$MYSQL_HOME/lib:/usr/local/mysql-x86/lib

# PostgreSQL
export PATH=/Library/PostgreSQL/9.0/bin:$PATH
export PGDATA=/Library/PostgreSQL/9.0/data

# MongoDB
export PATH=/Library/MongoDB/mongodb-osx-x86_64-1.6.3/bin:$PATH

# Firebird
export FIREBIRD_HOME=/Library/Frameworks/Firebird.framework/Resources
export PATH=$PATH:$FIREBIRD_HOME/bin

# node.js
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
export PATH=./node_modules/.bin:$PATH

# Android SDK
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk

# Modificações pessoais
alias ll='ls -l -h'
alias l.='ls -d * .*'

export PS1='[\u@\h \W]\$ ' # prompt igual ao do Linux
export LC_CTYPE="en_US.UTF-8"

export PATH=$HOME/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

