source /etc/profile

PATH=$PATH:/Users/longfin/dev/groovy-1.6.4/bin/
export PATH

##
# Your previous /Users/longfin/.bash_profile file was backed up as /Users/longfin/.bash_profile.macports-saved_2009-09-17_at_22:46:12
##

# MacPorts Installer addition on 2009-09-17_at_22:46:12: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.



export GRAILS_HOME=/Users/longfin/Library/grails-1.2.1
export PATH=$GRAILS_HOME/bin:$PATH
alias ll="ls -al"

export LANG=ko_KR.UTF-8

# Setting PATH for MacPython 3.0
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.0/bin:${PATH}"
#export PATH

PATH=$PATH:~/.cabal/bin
export PATH

#JAVA_TOOL_OPTIONS='-Dfile.encoding=UTF8 -Dswank.encoding=UTF8'
#export JAVA_TOOL_OPTIONS

PATH=$PATH:/Users/longfin/dev/Racket-5.1.1/bin
export PATH


MITSCHEME_LIBRARY_PATH=/Applications/mit-scheme.app/Contents/Resources
export MITSCHEME_LIBRARY_PATH

PATH=$PATH:/Users/longfin/dev/play-1.2.3
export PATH

PATH=$PATH:/Users/longfin/bin
export PATH

CLOJURESCRIPT_HOME=/Users/longfin/dev/clojurescript
export CLOJURESCRIPT_HOME

AWS_RDS_HOME=/Users/longfin/dev/RDSCli-1.6.001
export AWS_RDS_HOME

PATH=$PATH:$AWS_RDS_HOME/bin/
export PATH

#JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
#export JAVA_HOME

PATH=/Library/PostgreSQL/8.3/bin/:$PATH


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# ssh-agent variables
if [ -f ~/.ssh-agent.sh ]; then
    . ~/.ssh-agent.sh
fi
if [ ! -S $SSH_AUTH_SOCK ]; then
    ssh-agent -t 86400 > ~/.ssh-agent.sh
    echo "No agent! ssh-agent started."
    . ~/.ssh-agent.sh
fi

export PATH="/home/longfin/bin/:$PATH"
export PATH="/home/longfin/dev/depot_tools/:$PATH"
export PATH="/home/longfin/dev/adt-bundle-linux-x86_64/sdk/platform-tools:$PATH"
