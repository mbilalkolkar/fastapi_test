#!/bin/sh

# echo "-------------------root---------------------"
# ls /

echo "-------------------pwd----------------------"
pwd

echo "------------------- ls /app----------------------"
ls /app

echo "------------------ls----------------------------"
ls

# cd /app
# echo "--in /app-----------------------------------"
# pwd
# ls

# echo "--ls /app/app-----------------------------------"
# ls ./app

echo "-------------------------------entrypoint.sh---------------------------------"
if [ "$DEBUG" = "true" ]; then
    echo "Running in debug mode"
    # exec uvicorn main:app --host 0.0.0.0 --port 8000 --reload
    uv run fastapi dev --host 0.0.0.0
else
    echo "Running in production mode"
    # exec gunicorn main:app --bind 0.0.0.0:8000 --workers 3
    uv sync --no-cache
    uv run fastapi run
fi
