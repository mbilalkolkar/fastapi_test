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


# Copy the entrypoint script
# COPY entrypoint.sh /app/entrypoint.sh

# # Make the entrypoint script executable
RUN echo "sssssssssssssssssssssssssssssssssssssssssssssssssssnake"
RUN chmod +x /app/entrypoint.sh
# # RUN chmod +x /entrypoint.sh
RUN ls -lah
# RUN ls -lah /app
# RUN pwd
# RUN /app/entrypoint.sh
RUN uv sync --frozen --no-cache

# # Set the entrypoint to the shell script
# # ENTRYPOINT ["/entrypoint.sh"]

RUN ls -lah .venv/

# production
# CMD ["uv", "run", "fastapi", "run"] 
# CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["/app/.venv/bin/fastapi", "run", "/app/main.py", "--port", "80", "--host", "0.0.0.0"]
CMD ["/app/.venv/bin/fastapi", "run", "main:app", "--port", "8000", "--host", "0.0.0.0"]

# development
# CMD ["uv", "run", "fastapi", "dev"]
