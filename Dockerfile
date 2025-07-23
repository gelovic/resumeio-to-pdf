FROM python:3.9-slim

# Instalación de utilidades necesarias
RUN apt-get update \
    && apt-get install -y --no-install-recommends tesseract-ocr \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONPATH="${PYTHONPATH}:/app"

WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./
EXPOSE 8000
CMD [ "python", "app/main.py" ]
