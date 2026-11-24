FROM python:3.11-slim@sha256:07d4824036af339fa1b6ef769cc99d9c10a141769538b52b3b597c84f7a7b535 AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.11-slim@sha256:07d4824036af339fa1b6ef769cc99d9c10a141769538b52b3b597c84f7a7b535 AS runtime

WORKDIR /app
# Copy dependencies installed during the build stage
COPY --from=builder /install /usr/local

# Copy the Flask application
COPY app/app.py .

# Create a non-root user
RUN useradd --create-home \
    --shell /usr/sbin/nologin appuser

#Run the application as the non-root user
USER appuser

# Start the Flask application
CMD ["python", "app.py"]


