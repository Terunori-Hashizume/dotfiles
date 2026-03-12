export XDG_CONFIG_HOME="$HOME/.config"

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000

export LANG=en_US.UTF-8
export EDITOR=nvim
export VISUAL=nvim

# LS_COLORS (Rosé Pine Dawn) — same as fish vivid config
if command -v vivid &>/dev/null; then
  export LS_COLORS="$(vivid generate rose-pine-dawn)"
fi
