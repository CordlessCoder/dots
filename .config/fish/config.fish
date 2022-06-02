if status is-interactive
    starship init fish | source
    # Commands to run in interactive sessions can go here
    abbr yeet 'paru -Rcs'
    alias ip="ip -c"
    abbr pfetch paleofetch
    abbr polyfix 'xdo lower -N "Polybar"'
    alias v=nvim
    alias g=git
    alias ls=exa
    alias icat="kitty +kitten icat"
    fish_add_path ~/.cargo/bin
    if type rg &>/dev/null
        export FZF_DEFAULT_COMMAND='rg --files'
        export FZF_DEFAULT_OPTS='-m --height 50% --border'
    end
    alias sex startx
    if type -sq kitty; and type -sq xdo
        if type -sq neovide
            # alias nvm="xdo hide -p $KITTY_PID; neovide --nofork && xdo show -p $KITTY_PID"
            function nvm -d "Window swallower function for NeoVide" -w neovide
                xdo hide -p $KITTY_PID
                neovide --nofork $argv || /usr/bin/env nvim $argv
                xdo show -p $KITTY_PID
            end
            alias nvim=nvm
        end
        if type -sq zathura
            function zath -d "Window swallower function for zathura" -w zathura
                xdo hide -p $KITTY_PID
                zathura $argv && xdo show -p $KITTY_PID
            end
        end
    end
end


set -x MANPAGER nvimpager
set -x PAGER nvimpager
# what to add to path
export EDITOR='nvim'
export VISUAL='nvim'
