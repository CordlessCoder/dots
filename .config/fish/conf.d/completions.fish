#!/usr/bin/fish
if type -sq bob
    bob complete fish | source
end

if type -sq ein
    ein completions -s fish | source
end

if type -sq sqlx
    sqlx completions fish | source
end
