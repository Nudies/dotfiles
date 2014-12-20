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
