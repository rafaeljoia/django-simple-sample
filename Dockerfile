# Use uma imagem base do Python
FROM python:3.9-slim

# Instale o Poetry
# Instale o Poetry
RUN echo "Instalando Poetry..." && \
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

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

# Copie o arquivo pyproject.toml e o arquivo poetry.lock
COPY pyproject.toml poetry.lock ./

RUN echo "Executando instalação de dependências.."
# Instale as dependências usando Poetry
RUN /usr/local/bin/poetry install --no-root


# Copie o restante dos arquivos do projeto
COPY . .

# Exponha a porta 8000
EXPOSE 8000

RUN echo "Executando gunicorn"
# Defina o comando padrão a ser executado quando o contêiner for iniciado
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "django_simple_sample.wsgi:application"]
