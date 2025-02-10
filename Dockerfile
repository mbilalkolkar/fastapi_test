# Base image
FROM python:3.12-slim AS base
WORKDIR /app

# Install Poetry
#RUN pip install poetry
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
# ENV PYTHONUNBUFFERED=1
# ENV PYTHONDONTWRITEBYTECODE 1

# Copy the requirements file
# COPY requirements.txt /app

# Copy the poetry.lock and pyproject.toml to install dependencies
#COPY pyproject.toml poetry.lock ./
COPY pyproject.toml uv.lock ./


# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x entrypoint.sh
RUN chmod +x /entrypoint.sh



# Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# Install dependencies using poetry without virtualenv creation
#RUN poetry config virtualenvs.create false \
#  && poetry install --no-dev --no-interaction --no-ansi
# RUN uv sync --frozen 

# Set the entrypoint to the shell script
ENTRYPOINT ["/entrypoint.sh"]


# Stage 1: Development with hot reloading
FROM base AS dev
#UN uv sync --frozen 

RUN echo "---------------------------------------------current dir------------------"
RUN ls -lah

#CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
CMD ["uv", "run", "fastapi", "dev","--host", "0.0.0.0"]


# # Stage 2: Production with Gunicorn + Uvicorn workers
# FROM base AS prod
# RUN uv sync --frozen --no-cache
# ENV PYTHONUNBUFFERED=1
# #CMD ["gunicorn", "app.main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "--bind", "0.0.0.0:8000"]
# CMD ["uv", "run", "fastapi", "run"]