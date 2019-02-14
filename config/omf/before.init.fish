# Custom function

function fish_rspec
  if test -e ./bin/rspec
    ./bin/rspec $argv
  else
    bundle exec rspec $argv
  end
end

function fish_rails
  if test -e ./bin/rails
    ./bin/rails $argv
  else
    bundle exec rails $argv
  end
end

function fish_rake
  if test -e ./bin/rails
    ./bin/rake $argv
  else
    bundle exec rake $argv
  end
end

#
# Run solidus rspec tests for different solidus version
# Usage:
#   solidus_rspec_version all
#   solidus_rspec_version v1.1
#   solidus_rspec_version v1.1 spec/features/only_this_spec.rb
#   solidus_rspec_version all spec/features/only_this_spec.rb
#
function solidus_rspec_version
  set -l branch
  set -l branches
  set -l command

  switch $argv[1]
    case v1.0 v1.1 v1.2 v1.3 v1.4 v2.0 v2.1 v2.2 v2.3 v2.4 master
      echo $argv | read -l branch arguments
      echo "Test only "$branch
      set branches $branch
    case \*
      echo $argv | read -l arguments
      echo "Test on all branches"
      set branches v1.0 v1.1 v1.2 v1.3 v1.4 v2.0 v2.1 v2.2 v2.3 v2.4 master
  end

  for branch in $branches
    echo "Set "$branch
    set -gx SOLIDUS_BRANCH $branch

    echo "Remove Gemfile.lock"
    rm Gemfile.lock

    echo "Bundle install"
    bundle install

    echo "Bundle install"
    bundle exec rake test_app

    echo "rspec "$arguments
    fish_rspec $arguments
  end
end
