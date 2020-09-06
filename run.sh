#!/bin/bash
source /usr/share/webapp/bluetooth-control/venv/bin/activate
uwsgi --http :9090 --manage-script-name --mount /=app:app
