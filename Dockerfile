# Use uma imagem base do Python
FROM python:3.9

# Defina o diretório de trabalho como /app
WORKDIR /app

# Copie os requisitos do projeto e instale-os
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copie o código atual para o contêiner
COPY . .

# Exponha a porta 8000
EXPOSE 8000

# Comando para executar a aplicação quando o contêiner for iniciado
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
