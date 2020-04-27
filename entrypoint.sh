#!/bin/bash
/peering-manager/scripts/upgrade.sh

if [ ! -f "/config/install.lock" ]; then

    python3 manage.py createsuperuser --no-input
    touch /config/install.lock
fi
#Start Cron
/usr/sbin/cron -l 8
#Start Peering Manager
python3 manage.py runserver 0.0.0.0:8000 --insecure

