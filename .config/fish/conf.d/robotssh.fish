#!/usr/bin/fish
complete -c robotssh -s m -l monitor -d 'This port on the client will be used to listen for monitoring messages' -r
complete -c robotssh -s e -l echo -d 'The port used to access the server\'s TCP echo service, if one exists. Has no effect without --monitor-port' -r
complete -c robotssh -l ssh-path -d 'The path to SSH executable' -r -F
complete -c robotssh -l gate-time -d 'time to "make it out of the gate"' -r
complete -c robotssh -l max-start -d 'how many times to run (default no limit)' -r
complete -c robotssh -l backoff-fast-tries -d 'how many times to retry the connection without backing off' -r
complete -c robotssh -l backoff-upper-bound -d 'What should be the absolute maximum time between connection attempts' -r
complete -c robotssh -l max-lifetime -d 'how long can the process/daemon live' -r
complete -c robotssh -l poll-time -d 'Default connection poll time' -r
complete -c robotssh -l first-poll-time -d 'Initial connection poll time' -r
complete -c robotssh -l echo-message -r
complete -c robotssh -l max-conn-tries -d 'how many times to retry the network connection when monitoring' -r
complete -c robotssh -l net-timeout -d 'timeout on network data' -r
complete -c robotssh -l completions -d 'Print completions for a given shell to stdout' -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
function __has_double_dash
    if string match -- "--" "$argv" > /dev/null
        return 0
    end
    return 1
end
complete -c robotssh -s h -l help -d 'Print help'
complete -c robotssh -s V -l version -d 'Print version'
