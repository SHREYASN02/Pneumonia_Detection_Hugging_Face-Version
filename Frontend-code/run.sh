#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e



# Start the Gunicorn server
echo "Starting Gunicorn server..."
exec gunicorn -w 4 -b 0.0.0.0:7860 app:app
