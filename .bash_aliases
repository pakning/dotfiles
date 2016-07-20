
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#################################################
# Display
#################################################

# set up common aliases
alias la="ls -al"
alias lsd="ls -alhd"

# set up prompt
export PS1="[\h:\w \j]\$ "
# export PS1='# '

# set up emacs default size
# alias e="emacs -geometry 90x74+0+0"
alias emacs="emacs -nw"

export GREP_OPTIONS='--color=auto'

#################################################
# Development
#################################################

# want cores up to 70 MBs
ulimit -c 70000 

# ccache
export CCACHE_DIR=$HOME/tmp/ccc

# development
alias s="amake all -f run"
alias rl="amake all -f run sp2b.loaded"
alias t="time amake all -f run checkin"
alias f="amake -grep"
alias fp="amake -pgrep"
alias q="isbx -c"
alias qf="isbx -f"
alias qfe="isbx -c \"set plan_nprint to 1\" -f"
alias kx="killall -9 sbx sbx_go sbxmgrd"
alias spike="sh ~/asd/source/tools/spike.sh"
# alias sbxtest="~/asd/source/tools/isbx_query.py -f"
alias sbxtest="LD_LIBRARY_PATH=$HOME/asd/tools/lib:$HOME/asd/tools/lib64:$LD_LIBRARY_PATH ~/asd/obj/tools/run_spq_vfy"

alias qlog="isbx -f ~/asd/source/tools/qlog.rq"
alias qsum="isbx -f ~/asd/source/tools/qsum.rq -arg"
alias qcom="isbx -f ~/asd/source/tools/qcompile.rq -arg"
function qexplain() { isbx -c "select * where { table 'sth_explain' filter(?query=${1})}"; }

# canonical postgres
# alias qx="psql bchu -h 192.168.1.53 -p 5432 -U postgres -c"
# alias gengold="psql_query.py -d bchu -s 192.168.1.53 -p 5432 -u postgres -g -n -f"

# directory manipulation
alias showa="cd ~; ll -rtd asd*; cd -"
alias ff="find . -name"

function switch()
{
  cd ~
  rm -f asd
  ln -s "asd.${1}" "asd"
  ll -d asd
  cd -;
}

# svn
export SVN_EDITOR='emacs -nw'
# function svndiff () { svn diff --diff-cmd /usr/bin/diff -x "--minimal -w -U 3" $@ | colordiff | less -R -p" [0-9] @@"; }
# function ediff () { svn diff --diff-cmd /usr/bin/diff -x "--minimal -w -U 3" $@; }
# alias checkout="svn co https://sparqlrepo/svn/asd/trunk"

# git
# alias gitclone='git clone http://brianchu@dev.cambridgesemantics.com/stash/scm/sc/sparqlverse.git'
function gitclone() { git clone $HOME/asd.origin ${1}; cd ${1}; git remote set-url origin http://brianchu@dev.cambridgesemantics.com/stash/scm/sc/sparqlverse.git; }
alias gitlog='git --no-pager log --format=format:"------------------------------------------------%n%h | %an | %cd%n%n  %s%n%n%b%n"'
alias gitsum='git --no-pager log --format="tformat:%h  %Cred%ci%Creset  %<(15)%an - %s"'
alias gitdiff='git --no-pager diff --ignore-space-at-eol -b -w' 
alias gitdiffx='git --no-pager diff'
alias gitstash='git --no-pager stash'
alias gitshow='git --no-pager show'
alias gitgraph='git --no-pager log --graph --oneline --decorate'


# testing


# Purify
# source ~/dl/rational/purifyplus_setup.sh


PATH=$HOME/asd/tools/bin:/usr/lib/ccache:$PATH:/sbin:/usr/sbin:$HOME/bin:$HOME/asd/bin:$HOME/asd:$HOME/asd/source/tools:$HOME/asd/source/devtools:.


