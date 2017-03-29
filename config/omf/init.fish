# Make nvim the default editor
set -x EDITOR "nvim"

# Editor for opening gems
set -x BUNDLER_EDITOR "nvim"

# Bundle aliases
balias b "bundle"
balias be "bundle exec"
balias bi "bundle install"
balias bo "bundle open"

# Git
balias g "git"
balias gs "g status"
balias gd "g diff"
balias gb "git browse"

# Set bin Path
set PATH ~/.bin ./bin $PATH
