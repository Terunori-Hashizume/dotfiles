# Basics
export TERM=xterm-256color
export XDG_CONFIG_HOME=$HOME/.config
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
PROMPT="%n@%m: %~
$ "

# Ant
export ANT_HOME=/usr/local/bin/ant
export PATH=$PATH:$ANT_HOME/bin

# Gradle
export GRADLE_HOME=/usr/local/Cellar/gradle/5.0
export PATH=$PATH:$GRADLE_HOME/bin

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# AOJ
export P=$HOME/aoj/problems

# NeoVim
export V=$HOME/.config/nvim

# Language
export LANG=en_US.UTF-8

# Editor used when editing notes
export EDITOR=/usr/local/bin/nvim
