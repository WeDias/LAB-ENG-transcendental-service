#!/bin/sh

# Configuração da venv
ACTIVATE_FILE=venv/bin/activate
if [ ! -f "$ACTIVATE_FILE" ]; then
    python3 -m venv venv
    . "$ACTIVATE_FILE"
    pip install -r requirements.txt
fi

# Ativação da venv
. "$ACTIVATE_FILE"

# Transcendental service
gunicorn --bind 0.0.0.0:5002 app:app
