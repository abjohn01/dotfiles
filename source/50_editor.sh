# Editing

# if [[ ! "$SSH_TTY" ]] && is_osx; then
#   export EDITOR='mvim'
#   export LESSEDIT='mvim ?lm+%lm -- %f'
# else
  export EDITOR='vim'
# fi

export VISUAL="$EDITOR"
alias q="$EDITOR"
alias qv="q $DOTFILES/link/.{,g}vimrc +'cd $DOTFILES'"
alias qs="q $DOTFILES"
alias sublp="if [ -f *.sublime-project ]; then subl --project *.sublime-project; else echo 'No Sublime Project Found'; fi"