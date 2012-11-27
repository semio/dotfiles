# path
export PATH="/usr/local/bin":$PATH:"/usr/local/sbin/":"/Users/semio/bin":"/Users/semio/.bin":"/Users/semio/node_modules/.bin":/usr/local/ActivePerl-5.14/bin:$HOME/Library/Haskell/bin
export NODE_PATH="/User/semio/node_modules"
export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/

COPYFILE_DISABLE=1; export COPYFILE_DISABLE

# command alias
alias ls='ls -G'
alias t='python ~/src/t/t.py --task-dir ~/Desktop --list TASKS.txt'
export LESS='-P%f (%i/%m) Line %lt/%L'
alias s='ssh -D 1070'

# RVM
#[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm" # 

# history
export HISTFILESIZE=10000
export HISTSIZE=10000
shopt -s histappend


# promote
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
PROMPT_COMMAND='history -a'
PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w \n\$\[\033[00m\] '

svnecf()
{
        tarfile=$1
        start_rev=$2
        end_rev=$3
         
        if [[ "$end_rev" == "" ]]; then
                 end_rev='HEAD'
        fi
         
        svn diff -r "$start_rev":"$end_rev" --summarize |
        awk '{if ($1 != "D") print $2}'|   
        xargs  -I {} tar -rvf "$tarfile" {}
}


