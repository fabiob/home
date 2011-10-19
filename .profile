alias ll='ls -lG'
export POSITION='top'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=$PATH:/usr/local/mysql/bin

export NLS_LANG="AMERICAN_AMERICA.UTF8"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/Projects/CCDE/ccde-tools/scripts

# Oracle and MySQL 32-bit
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql-5.5.15-osx10.6-x86/lib:/usr/lib/oracle/instantclient_10_2
