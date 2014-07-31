#!/bin/bash -xe

# Make sure this runs, even if something blows up.
trap "bundle exec rake signonotron:stop" EXIT

# Gemfile.lock is not in source control because this is a gem
rm -f Gemfile.lock
rm -f gemfiles/*.gemfile.lock

# Exclude /tmp from git clean as it only contains the signonotron checkout
git clean -fdxe /tmp

bundle install --path "${HOME}/bundles/${JOB_NAME}"

bundle exec rake

if [[ -n "$PUBLISH_GEM" ]]; then
  bundle exec rake publish_gem
fi
