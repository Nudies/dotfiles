# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias ls="ls -aF --color"
alias cl="clear && printf '\033[3J'"
alias v2="cd /home/jaminb/v2"
alias findfatal='/home/jaminb/v2/temp/victor/tmpScripts/findfatal.py "$@"'
alias atpending='/home/jaminb/v2/temp/gwicks/scr/atpending'
alias guniq='/home/jaminb/v2/temp/gwicks/scr/guniq "$@"'
alias pypender='/home/jaminb/v2/temp/minh/scripts/pypender/pypender.py "$@"'
alias mparse='/home/jaminb/v2/temp/mgoodwin/scripts/mparse'
alias turf-format='python /home/jaminb/v2/temp/briang/python/combo.py'
alias mcomment='/home/jaminb/v2/temp/mgoodwin/scripts/mcomment'
alias rem='copy-survey -m clear'

#screen alias shortcuts
alias sl="screen -ls"
alias sr="screen -dR"

#Prompt settings
PROMPT_COMMAND='printf "\033]0;%s@%s.la:%s\033\\" "${USER}" "${HOSTNAME%%.*}" " $PWD"'
PS1='\[\e[0;36m\]\[\e[40m\]\u[\W] [$(date +%k:%M)]\[\e[m\] \[\e[1;32m\]\$ \[\e[m\]'
LS_COLORS='di=33:fi=0'
export LS_COLORS

case "$TERM" in
        screen*)
                PROMPT_COMMAND='audit;echo -ne "\033k\033\0134\033k[$(echo $(basename $(dirname $PWD))/`basename $PWD`)]\033\0134\033_$PWD\033\\"'
                ;;
esac