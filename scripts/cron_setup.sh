#!/bin/bash

echo "Beepity boop I am setting up a cron job"

# Add cron job to crontab
# We redirect the output of the cron job (> /proc/1/fd/1 2>&1) so that it will be
# included in standard error / out.
# For more context: https://gist.github.com/mowings/59790ae930accef486bfb9a417e9d446

(echo "*/1 * * * * /bin/bash -l -c 'cd /usr/src/app && pwd && bundle show' > /proc/1/fd/1 2>&1") | crontab

#cd /usr/src/app && bundle exec rake check:all

echo "Starting cron ..."
# Run cron in the foreground, but make it not block subsequent processes
cron start