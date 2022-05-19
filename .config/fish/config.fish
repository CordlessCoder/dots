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
    if type rg &>/dev/null
        export FZF_DEFAULT_COMMAND='rg --files'
        export FZF_DEFAULT_OPTS='-m --height 50% --border'
    end
    alias sex startx
end
# what to add to path
export EDITOR='nvim'
export VISUAL='nvim'
