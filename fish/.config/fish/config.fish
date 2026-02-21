if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_vi_key_bindings

set fish_greeting # No greeting messages

# colortheme
fish_config theme choose "Rosé Pine Dawn"
if type -q vivid
    set -gx LS_COLORS (vivid generate rose-pine-dawn)
end

# prompt
if type -q starship
    starship init fish | source
end

# directory navigation
if type -q zoxide
    zoxide init fish | source
end

# file manager
if type -q yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end

# fzf.fish (plugin)
if type -q eza
    set fzf_preview_dir_cmd eza --all --color=always
end
