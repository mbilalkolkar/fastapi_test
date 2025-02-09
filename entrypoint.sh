#!/bin/sh
pwd
cd /app
pwd
echo "-------------------------------entrypoint.sh---------------------------------"
if [ "$DEBUG" = "true" ]; then
    echo "Running in debug mode"
    # exec uvicorn main:app --host 0.0.0.0 --port 8000 --reload
    exec uv run fastapi dev
else
    echo "Running in production mode"
    # exec gunicorn main:app --bind 0.0.0.0:8000 --workers 3
    exec uv sync --no-cache
    exec uv run fastapi run
fi
