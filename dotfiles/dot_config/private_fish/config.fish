# Disable fish greeting
set fish_greeting

# Enable zoxide
zoxide init fish | source

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

fish_add_path /home/username/.spicetify
