# path
#

# stop copying the DS_ files to tarball
COPYFILE_DISABLE=1; export COPYFILE_DISABLE

# command alias
alias ls='ls -G'
alias t='python ~/src/t/t.py --task-dir ~/Desktop --list TASKS.txt'
#export LESS='-P%f (%i/%m) Line %lt/%L'
alias s='ssh -D 1070'

# RVM
#[[ -s "/usr/local/rvm/scripts/rvm" ]] && . "/usr/local/rvm/scripts/rvm" # 

# history
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:clear:exit:date:* --help"

# promote
#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
PROMPT_COMMAND='history -a'
PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w \n\$\[\033[00m\] '

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# reset colors
. ~/.colors


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Prefer US English and use UTF-8
# Comment below 2 lines to solve sed problem
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export LC_CTYPE="C"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion


## functions

# Compare svn versions and zip the related files.
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
        xargs  -I "{}" tar -rvf "$tarfile" "{}"
}


