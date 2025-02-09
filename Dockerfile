#FROM python:3.10-slim
FROM ghcr.io/astral-sh/uv:alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

#COPY requirements.txt /app/

#RUN pip install --no-cache-dir uv

COPY . /app/
RUN apk add --no-cache python3~=3.12
#RUN uv sync

# production
# CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# CMD ["uv", "run", "fastapi", "run"] 

# development
# CMD ["uv", "run", "fastapi", "dev"]


# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the shell script
ENTRYPOINT ["/entrypoint.sh"]