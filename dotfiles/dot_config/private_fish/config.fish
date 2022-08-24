# Disable fish greeting
set fish_greeting

# Enable zoxide
zoxide init fish | source

# Set some fish cars
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config/
set -gx FZF_DEFAULT_OPTS "\
set -gx LS_COLORS "$(cat $HOME/.config/exa/lscolors_catppuccin)"
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Set some aliases
alias cd="z"
alias ls="exa"
alias cat="bat"

# Set $PATH
fish_add_path -p $HOME/bin $HOME/.cargo/bin

# Enable pyenv
pyenv init - | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
