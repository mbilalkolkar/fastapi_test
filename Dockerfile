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

RUN uv run python manage.py collectstatic --noinput
RUN uv run python manage.py  makemigrations --noinput
RUN uv run python manage.py  migrate --noinput


CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "${APP_PORT}"]