#!/bin/fish
if status is-interactive
    if type -sq zellij
        # ...
        eval (zellij setup --generate-completion fish | string collect) &
        function za
            # function that lists all attachable shells if there are any and no arguments are provided,
            if not isatty stdin
                return
            end
            if test -n "$argv[1]" # If a session name was provided
                zellij attach -c "$argv[1]"
            else
                set shells "$(zellij list-sessions 2> /dev/null)"
                if test -n "$shells"
                    # If there are active sessions
                    set choice $(echo "$shells" | fzf --preview "")
                    if test -n "$choice"
                        zellij attach "$choice"
                    else
                        zellij
                    end
                else
                    zellij attach -c
                end
            end

        end

        complete -c za -f -a "(__fish_complete_sessions)" -d Session

        function __fish_complete_sessions
            zellij list-sessions 2>/dev/null
        end
        abbr zc "zellij attach -c"
        abbr zz zellij
        # eval (zellij setup --generate-auto-start fish | string collect)
    end
end
