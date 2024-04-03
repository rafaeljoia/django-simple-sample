#!/bin/bash

# Comando para aplicar migrações do Django
python manage.py migrate

# Comando para coletar arquivos estáticos
python manage.py collectstatic --noinput

# Comando para iniciar o servidor Django
python manage.py runserver 0.0.0.0:8000
