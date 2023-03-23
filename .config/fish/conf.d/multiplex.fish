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
                set sessions (zellij list-sessions 2> /dev/null | string collect)
                set sessions (string replace --regex '^.*\(current\)[^\S\r\n]*[\r\n]*' '' "$sessions" | string collect)
                if test -n "$sessions"
                    # If there are active sessions
                    set choice (echo (string replace " " '
' "$sessions" | string collect) | fzf --preview "")
                    if test -n "$choice"
                        zellij attach "$choice"
                    else
                        zellij
                    end
                else
                    zellij
                end
            end

        end
        complete -c za -f -a "(__fish_complete_sessions)" -d Session
        function zk
            # function that lists all running sessions and allows you to pick which one to kill
            if test -n "$argv[1]" # If a session name was provided
                zellij kill-session "$argv[1]"
            else
                set sessions (zellij list-sessions 2> /dev/null | string collect)
                if test -n "$sessions"
                    # If there are active sessions
                    set choice (echo "$sessions" | fzf --preview "" | string collect)
                    set choice (string replace --regex "[^\S\r\n]*\(current\)[^\S\r\n]*[/r/n]*" "" "$choice" | string collect)
                    if test -n "$choice"
                        # set choice (string replace "
                        # " " " $choice | string collect)
                        for session in (echo $choice)
                            zellij kill-session "$session"
                        end
                    else
                        zellij kill-session
                    end
                else
                    echo "No ZelliJ sessions are currently running"
                end
            end

        end
        complete -c zk -f -a "(__fish_complete_sessions)" -d Session

        function __fish_complete_sessions
            zellij list-sessions 2>/dev/null
        end
        abbr zz zellij
        # eval (zellij setup --generate-auto-start fish | string collect)
    end
end
