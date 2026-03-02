#!/bin/sh
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
dir=$(basename "$cwd")

model=$(echo "$input" | jq -r '.model.display_name // empty')

used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Colors (ANSI)
cyan='\033[0;36m'
yellow='\033[0;33m'
green='\033[0;32m'
red='\033[0;31m'
reset='\033[0m'

# Build status line
output=""

# Directory (cyan)
if [ -n "$dir" ]; then
  output="${output}$(printf "${cyan}%s${reset}" "$dir")"
fi

# Model (yellow)
if [ -n "$model" ]; then
  output="${output}  $(printf "${yellow}%s${reset}" "$model")"
fi

# Context usage
if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  if [ "$used_int" -ge 80 ]; then
    ctx_color="$red"
  elif [ "$used_int" -ge 50 ]; then
    ctx_color="$yellow"
  else
    ctx_color="$green"
  fi
  output="${output}  $(printf "${ctx_color}ctx: %s%%%s" "$used_int" "$reset")"
fi

printf "%b\n" "$output"
