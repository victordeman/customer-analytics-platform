FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY scripts/ ./scripts
COPY config/ ./config
CMD ["python", "scripts/etl_pipeline.py"]
