# ── Shell Options ──
setopt IGNOREEOF
setopt no_flow_control
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt correct
setopt auto_cd
setopt interactive_comments

# ── Vi Key Bindings ──
bindkey -v
export KEYTIMEOUT=1

# ── Completion (must run before fzf-tab) ──
autoload -Uz compinit
compinit

# ── Plugins (sheldon) ──
eval "$(sheldon source)"

# ── Starship Prompt ──
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# ── Zoxide ──
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# ── fzf Key Bindings & Completion ──
if command -v fzf &>/dev/null; then
  source <(fzf --zsh)
fi

# ── fzf-tab: eza preview ──
if command -v eza &>/dev/null; then
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --all --color=always $realpath'
  zstyle ':fzf-tab:complete:ls:*' fzf-preview 'eza --all --color=always $realpath'
fi

# ── Yazi File Manager ──
if command -v yazi &>/dev/null; then
  function y() {
    local tmp
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    command yazi "$@" --cwd-file="$tmp"
    if local cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  }
fi
