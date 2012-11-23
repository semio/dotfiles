# path

# for ls
alias ls='ls -G'

# for todo.sh
alias t='todo.sh -d ~/.todo.cfg'
export TODOTXT_DEFAULT_ACTION=ls
#source ~/.todocomplete.bash
. .bash_completion/*

# RVM
#[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm" # 


# promote
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '

# svn helper
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


