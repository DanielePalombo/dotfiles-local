set fish_greeting

set -x VISUAL nvim
set -x EDITOR "$VISUAL"
set -x BUNDLER_EDITOR "nvim"
set -x GREP_COLOR "1;37;45"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x DISABLE_SPRING 1

# Paths
test -d /usr/local/sbin ; and set PATH /usr/local/sbin $PATH
test -d /usr/local/bin  ; and set PATH /usr/local/bin $PATH
test -d ~/.bin          ; and set PATH ~/.bin $PATH

# Navigation
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

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

# Set fzf in halt height
set -U FZF_TMUX 1

# aliases
if test -e ~/.aliases
  source ~/.aliases
end

# Create a JAVA_HOME variable, determined dynamically
# export JAVA_HOME=$(/usr/libexec/java_home)
# Add that to the global PATH variable
# export PATH=${JAVA_HOME}/bin:$PATH
# Set Android_HOME
#set -x ANDROID_HOME '/usr/local/Caskroom/android-sdk/25.2.3'
set -x ANDROID_HOME '~/Library/Android/sdk/'
# Add the Android SDK to the ANDROID_HOME variable
set -gx PATH $ANDROID_HOME/platform-tools $PATH
set -gx PATH $ANDROID_HOME/tools $PATH
#Set GRADLE_HOME
# export GRADLE_HOME=/Library/gradle/gradle-3.2
# export PATH=$PATH:$GRADLE_HOME/bin

# set -g fish_user_paths "/usr/local/opt/mysql@5.5/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/elasticsearch@5.6/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/elasticsearch@5.6/bin" $fish_user_paths
