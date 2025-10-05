FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates && rm -rf /var/lib/apt/lists/* && \
    useradd --create-home --uid 1000 appuser

WORKDIR /app
ENV APP_PORT=7235
EXPOSE 7235

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=1000:1000 . .
USER 1000

CMD ["sh", "-c", "uvicorn main:app --host 0.0.0.0 --port ${APP_PORT}"]
