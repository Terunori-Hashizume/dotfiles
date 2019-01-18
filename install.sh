#!/bin/bash
packagelist=(
# terminal
"tmux"
# develop tools
"ruby"
# others
"w3m"
"calcurse"
)

sudo apt-get update

# this is only for ubuntu and debian
echo "start apt install apps..."
for item in ${packagelist[@]}; do
    sudo apt-get install -y ${item}
done

sudo apt-get upgrade
