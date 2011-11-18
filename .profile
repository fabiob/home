# habilita cores no "ls"
export CLICOLOR=1

# ajuste para uso do Ruby no MacOS X Lion
export CC=/usr/bin/gcc-4.2

# adaptação para Homebrew
export PATH=/usr/local/bin:$PATH

# Oracle Instant Client
# 64-bit: export DYLD_LIBRARY_PATH=/usr/lib/oracle/instantclient
export DYLD_LIBRARY_PATH=/usr/lib/oracle/instantclient_10_2-i386
export ORACLE_HOME=/usr/lib/oracle/instantclient
export SQLPATH=/usr/lib/oracle/instantclient
export TNS_ADMIN=/usr/lib/oracle/network/admin
export NLS_LANG=AMERICAN_AMERICA.UTF8
export PATH=$PATH:/usr/lib/oracle/instantclient

# MySQL
export PATH=$PATH:/usr/local/mysql/bin
# 64-bit: export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql-x86/lib

# Subversion
export PATH=/opt/subversion/bin:$PATH

# PostgreSQL
export PATH=/Library/PostgreSQL/9.0/bin:$PATH
export PGDATA=/Library/PostgreSQL/9.0/data

# MongoDB
export PATH=/Library/MongoDB/mongodb-osx-x86_64-1.6.3/bin:$PATH

# node.js
NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Complete para rake, thor e cap
[[ -s "$HOME/bin/rake_cap_bash_autocomplete.sh" ]] && . "$HOME/bin/rake_cap_bash_autocomplete.sh"

# Modificações pessoais
alias ll='ls -l -h'
alias l.='ls -d * .*'

export PS1='[\u@\h \W]\$ ' # prompt igual ao do Linux
export LC_CTYPE="en_US.UTF-8"

export PATH=$HOME/bin:$PATH
