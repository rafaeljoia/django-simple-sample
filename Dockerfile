# Use uma imagem base do Python
FROM python:3.9-slim

# Defina variáveis de ambiente
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Instale as dependências do sistema
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \
        gettext && \
    rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo requirements.txt
COPY requirements.txt .

# Instale as dependências usando pip
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante dos arquivos do projeto
COPY . .

# Exponha a porta 8000
EXPOSE 8000

# Defina o comando padrão a ser executado quando o contêiner for iniciado
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "django_simple_sample.wsgi:application"]
