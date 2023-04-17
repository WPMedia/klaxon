#!/bin/bash

if [[ "$USE_CRON" == "true" ]]; then
    # Add crontab jobs
    echo "Calling script to set up server cronjobs"
    /bin/bash scripts/cron_setup.sh
    
    # Initialize app with initial diff check on watched pages
    echo "Initial check on watched pages" 
    bundle exec rake check:all
else
    echo "Skipping cron setup"
fi

# Compile static assets before launching server
bundle exec rails assets:precompile

# Launch the main container command passed as arguments.
exec "$@"
