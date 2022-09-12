# Disable fish greeting
set fish_greeting

# Set $PATH
fish_add_path -p $HOME/bin $HOME/.cargo/bin

# Enable pyenv
pyenv init - | source

if status is-interactive
    # Enable zoxide
    zoxide init fish | source

    # Set some aliases
    alias cd="z"
    alias ls="exa"
    alias cat="bat"

    # Bind Alt+c to pipe current or last command output to clipboard
    bind \ec "fish_commandline_append ' | xclip -selection clipboard'"
end

# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

fish_add_path /home/username/.spicetify
