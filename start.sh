#!/bin/sh

# Get the base directory and switch into it
basedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')");
cd "$basedir";

# Check if the bot is in the process list
if pm2 list | grep MCRBot >/dev/null 2>&1 ; then
    sh restart.sh
else
    # Compile the typescript files to javascript
    ./node_modules/.bin/tsc;

    # Start the bot
    pm2 start index.js --name MCRBot --time;

    echo >&2 "[OK] MCRBot started!";
fi