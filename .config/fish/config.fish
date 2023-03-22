#!/bin/fish
export EDITOR='nvim'
export VISUAL='nvim'
export OXPEN_HEIGHT_ADJ='2'
if not status is-interactive
    exit
end
function paste
    if isatty stdin && test -n "$argv[1]"
        set file $argv[1] || return
        if test -f $file
            set_color blue && curl --data-binary @$file https://oxlink.dev && test -n "$argv[2]" && echo ".$argv[2]"
        else
            set_color blue && echo "$argv" | curl --data-binary @- https://oxlink.dev
        end
        echo
    else
        read -z -p "set_color -o blue;echo What do you want to paste\?;set_color -o white;echo \>" text || return
        set_color blue && string join -- "
" $text | curl --data-binary @- https://oxlink.dev && test -n "$argv[1]" && echo ".$argv[1]" || echo
    end
end
abbr p paste
set fish_greeting ""
if [ $TERM = st-256color ]
    export COLORTERM=truecolor
end
starship init fish | source
# Commands to run in interactive sessions can go here
abbr yeet 'paru -Rcs'
alias ip="ip -c"
abbr pfetch paleofetch
abbr polyfix 'xdo lower -N "Polybar"'
# abbr rm "rm -I"
# alias v=nvim
alias g=git
alias l="exa -l --icons --color=always"
alias ls="exa --color=auto"
alias la="ls -a"
alias icat="kitty +kitten icat"
set PATH "$HOME/.local/bin:""$PATH"
if type rg &>/dev/null
    export FZF_DEFAULT_COMMAND='rg --files'
end
export FZF_DEFAULT_OPTS="-m --height 80% --layout reverse --border none --marker \-\> --pointer ❯ --prompt ❯'"
if type -sq bat
    alias cat="bat --color auto -pp --wrap never"
    export FZF_DEFAULT_OPTS="-m --height 80% --layout reverse --border none --marker \-\> --pointer ❯ --prompt ❯ --preview-window right,60%,sharp --preview 'bat --color always -pp --wrap never -r :200 {} '"
    export FZF_CTRL_R_OPTS="--preview-window hidden"
else
end
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
# set RUSTC_WRAPPER sccache
