FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        gettext && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY django_simple_sample .


EXPOSE 8000


CMD ["gunicorn", "--bind", "0.0.0.0:8000", "django_simple_sample.wsgi:application"]
