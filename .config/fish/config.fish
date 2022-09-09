if status is-interactive
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
    abbr rm "rm -I"
    alias v=nvim
    alias g=git
    alias ls="exa -l --icons --color=always"
    alias icat="kitty +kitten icat"
    fish_add_path ~/.cargo/bin
    if type rg &>/dev/null
        export FZF_DEFAULT_COMMAND='rg --files'
        export FZF_DEFAULT_OPTS='-m --height 50% --border'
    end
    alias sex startx
    if type -sq xdo
        and test -n "$DISPLAY"
        if type -sq neovide
            complete -c neovide -s h -l help -d "Prints help information"
            complete -c neovide -l log -d "Log to a file"
            complete -c neovide -l maximized -d "Maximize the window"
            complete -c neovide -l multigrid -d "Enable Multigrid"
            complete -c neovide -l nofork -d "Do not detach process from terminal"
            complete -c neovide -l noidle -d "Render every frame. Takes more power and cpu time but possibly fixes animation issues"
            complete -c neovide -l nosrgb -d "Do not use standard color space to initialize the window. Swapping this variable
sometimes fixes"

            complete -c neovide -s V -l version -d "Prints version information"
            complete -c neovide -l wsl -d "Run in WSL"

            complete -c neovide -l frame -d "Configure the window frame. NOTE: Window might not be resizable if setting"
            complete -c neovide -l geometry -d "Specify the Geometry of the window"
            complete -c neovide -l neovim-bin -d "Specify path to neovim"
            complete -c neovide -l remote-tcp -d "Connect to Remote TCP"
            complete -c neovide -l wayland-app-id -d "Specify an App ID for Wayland"
            complete -c neovide -l waylx11-wm-class -d "Specify an X11 WM class"
            function n -d "Window swallower function for NeoVide" -w neovide
                set windowpid (xdo pid -t $WINDOWID)
                xdo hide -p $windowpid
                neovide --nofork $argv
                xdo show -p $windowpid
            end
            function ns -d "Open NeoVim without window swallowing" -w neovide
                neovide $argv &
            end
            # alias nvim n
        end
        if type -sq zathura
            function zath -d "Window swallower function for zathura" -w zathura
                set windowpid (xdo pid -t $WINDOWID)
                xdo hide -p $windowpid
                zathura $argv && xdo show -p $windowpid
                xdo show -p $windowpid
            end
        end
    end
end


# set -x MANPAGER nvimpager
# set -x PAGER nvimpager
# what to add to path
export EDITOR='nvim'
export VISUAL='nvim'
