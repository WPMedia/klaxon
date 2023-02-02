#!/bin/bash

# Add crontab jobs
echo "Calling script to set up server cronjobs"
/bin/bash scripts/cron_setup.sh

pwd
bundle show
echo "skip skip skip skip skip"

# Launch the main container command passed as arguments.
exec "$@"