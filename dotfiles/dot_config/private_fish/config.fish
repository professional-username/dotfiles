# Disable fish greeting
set fish_greeting

set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config/

# Set $PATH
fish_add_path -p $HOME/bin $HOME/.cargo/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
