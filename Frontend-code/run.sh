#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Wait for the database file to be created, and then initialize it.
echo "Initializing database..."
python -c 'from app import init_db; init_db()'
echo "Database initialization complete."

# Start the Gunicorn server
echo "Starting Gunicorn server..."
exec gunicorn -w 4 -b 0.0.0.0:7860 app:app
