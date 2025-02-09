# FROM python:3.10-slim
# FROM ghcr.io/astral-sh/uv:alpine
FROM python:3.12-slim

# Install uv.
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# Copy the application into the container.
COPY . /app/

WORKDIR /app

# RUN apk add --no-cache python3~=3.12
# RUN pip install --no-cache-dir uv
#RUN uv sync

# production
# CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["uv", "run", "fastapi", "run"] 

# Run the application.
# CMD ["/app/.venv/bin/fastapi", "run", "app/main.py", "--port", "80", "--host", "0.0.0.0"]

# development
# CMD ["uv", "run", "fastapi", "dev"]


# Copy the entrypoint script
# COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to the shell script
ENTRYPOINT ["/app/entrypoint.sh"]