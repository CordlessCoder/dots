abbr c cargo
abbr cr cargo run
abbr crr cargo run --release
abbr cb cargo build
abbr cbr cargo build --release
abbr yeet 'paru -Rcs'
alias less="less -R"
alias ip="ip -c"
# abbr pfetch paleofetch
# abbr polyfix 'xdo lower -N "Polybar"'
# abbr rm "rm -I"
alias g=git
alias l="eza -l --icons --color=always --group-directories-first -b"
alias ls="eza --color=auto --group-directories-first"
alias la="l -a"
# alias icat="kitty +kitten icat"

if type -sq bat
    alias cat="bat --color auto -pp --wrap never"
    export FZF_DEFAULT_OPTS="-m --height 80% --layout reverse --border none --marker \-\> --pointer ❯ --prompt ❯ --preview-window right,60%,sharp --preview 'bat --color always -pp --wrap never -r :200 {} '"
    export FZF_CTRL_R_OPTS="--preview-window hidden"
end

if type -sq startx
    alias sex startx
end

if type -sq zoxide
    zoxide init fish | source
    alias cd z
end
