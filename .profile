# define o Vim como o editor padrão
export EDITOR=vim

# habilita cores no "ls"
export CLICOLOR=1

# adaptação para Homebrew: incluir /usr/local/[s]bin *antes* de /usr/bin
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# EC2 tools
if [ -d "$HOME/.ec2" ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
  export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
  export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
  export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
fi

# AWS CLI
complete -C aws_completer aws

# Docker
eval "$(docker-machine env dev)"

# Oracle Instant Client
#export DYLD_LIBRARY_PATH=/usr/lib/oracle/instantclient
##export DYLD_LIBRARY_PATH=/usr/lib/oracle/instantclient_10_2-i386
#export ORACLE_HOME=/usr/lib/oracle/instantclient
#export SQLPATH=/usr/lib/oracle/instantclient
#export TNS_ADMIN=/usr/lib/oracle/network/admin
#export NLS_LANG=AMERICAN_AMERICA.UTF8
#export PATH=$PATH:/usr/lib/oracle/instantclient

# MySQL
export MYSQL_HOME=/usr/local/mysql-x86_64
export PATH=$PATH:$MYSQL_HOME/bin
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$MYSQL_HOME/lib:/usr/local/mysql-x86/lib

# PostgreSQL
export PATH=/Library/PostgreSQL/9.0/bin:$PATH
export PGDATA=/Library/PostgreSQL/9.0/data

# MongoDB
export PATH=/Library/MongoDB/mongodb-osx-x86_64-1.6.3/bin:$PATH

# node.js
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
export PATH=./node_modules/.bin:$PATH

# Rails + Spring
export PATH=./bin:$PATH

# Android SDK
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# z
. `brew --prefix`/etc/profile.d/z.sh

# Modificações pessoais
alias ll='ls -l -h'           # "ls" mais amigável
alias l.='ls -d * .*'         # "ls" para arquivos ocultos

export PS1='[\u@\h \W]\$ '    # prompt igual ao do Linux
export LC_CTYPE="en_US.UTF-8" # locale americano e codificação UTF-8 como padrão

export PATH=$HOME/bin:$PATH   # ~/bin como primeiro item do $PATH

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# direnv: https://github.com/zimbatm/direnv
eval "$(direnv hook $0)"
