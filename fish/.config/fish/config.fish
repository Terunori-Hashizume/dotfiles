if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

set fish_greeting # No greeting messages

# colortheme
fish_config theme choose "Rosé Pine Dawn"

# prompt
starship init fish | source

# directory navigation
zoxide init fish | source

# file manager
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# fzf.fish (plugin)
set fzf_preview_dir_cmd eza --all --color=always
