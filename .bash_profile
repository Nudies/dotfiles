# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# User specific aliases and functions
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias ls="ls -GFa"

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

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
