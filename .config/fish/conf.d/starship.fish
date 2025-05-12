#!/bin/fish
if type -sq starship
    starship init fish | source
else
    if test -e "$HOME/.cache/fish/starship_ignore"
        return
    end
    echo "WARNING: Could not find `starship`, defaulting to the stock prompt."
    test -e "$HOME/.cache/fish" || mkdir "$HOME/.cache/fish"
    touch "$HOME/.cache/fish/starship_ignore"
end
