set fish_greeting

set -x EDITOR nvim
set -x GREP_COLOR "1;37;45"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

# Paths
test -d /usr/local/sbin          ; and set PATH /usr/local/sbin $PATH
test -d /usr/local/bin           ; and set PATH /usr/local/bin $PATH

# Navigation
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

function be        ; bundle exec $argv ; end
function d        ; du -h -d=1 $argv ; end
function df       ; command df -h $argv ; end
function f        ; foreman run bundle exec $argv ; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion b 'bundle exec'
make_completion f 'foreman run'
make_completion g 'git'
make_completion mp 'nvim'
make_completion vp 'nvim'

# rbenv
status --is-interactive; and . (rbenv init -|psub)

# hub
eval (hub alias -s)
