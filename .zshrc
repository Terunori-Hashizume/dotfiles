eval "$(rbenv init -)"

# alias

alias google="~/shell_tools/google_search.sh"
alias vi="nvim"
alias c="clear"
alias la="ls -a"
alias ll="ls -l"

# configure and source zsh
alias cnfzr="vi ~/.zshrc"
alias cnfen="vi ~/.zshenv"
alias srczsh="source ~/.zshenv && source ~/.zshrc"

# competitive programmingg
alias run="~/aoj/tools/run_test_cases.sh"
alias mkatcdir="~/aoj/tools/make_problem_dirs.sh"
alias load_tasks="~/aoj/tools/load_tasks_html.sh"

# emacs keybinding
bindkey -e

# prevent from logout with C-d
setopt IGNOREEOF

# disable C-s lock and C-q unlock
setopt no_flow_control

# enable colors
autoload -Uz colors
colors

# completion
autoload -Uz compinit
compinit

# share history with other terminals
setopt share_history

# don't show duplicates in history
setopt histignorealldups

# correct command misspelling
setopt correct

# enable delete and ebackspace
stty erase ^H
bindkey "^[[3~" delete-char

