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
