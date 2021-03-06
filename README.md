# peering-manager-docker
This repository is a Docker image for https://github.com/respawner/peering-manager/

This imagee include a custom configuration file that allow to get configuration from the ENV.
This image was designed to be use in a non-produtcion environement (Dev, test, etc) and is not enouth tested.
Use this image at your own risk.

## What the image do

 1. Check if a database upgrade or install is required and update the statics files
 2. Update python dependancy
 3. Check if install.lock is available
 4. If not create django superuser based en ENV var :
     - DJANGO_SUPERUSER_USERNAME (Mandatory, default root)
     - DJANGO_SUPERUSER_PASSWORD (Mandatory, default changeMe)
     - DJANGO_SUPERUSER_EMAIL (Mandatory, default root@localhost)

## Minimal Dockerfile

    version: '3.1'
    
    services:
    
      db:
        image: postgres
        restart: always
        environment:
          POSTGRES_USER: peering_manager
          POSTGRES_PASSWORD: example
    
      peering_manager:
        image: mckay1717/peering-manager
        restart: always
        environment:
          DATABASE_NAME: peering_manager
          DATABASE_USER: peering_manager
          DATABASE_PASSWORD: example
          DATABASE_HOST: db
          SECRET_KEY: ramdom String
        ports:
          - 8080:8000


## ENV  

- DJANGO_SUPERUSER_PASSWORD (Mandatory, default changeMe)
- DJANGO_SUPERUSER_EMAIL (Mandatory, default changeMe)
- DJANGO_SUPERUSER_USERNAME (Mandatory, default root)
- MY_ASN (Optional, default 64512)
- ALLOWED_HOSTS (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- DATABASE_NAME (Mandatory, default peering_manager)
- DATABASE_USER (Mandatory, default devbox)
- DATABASE_PASSWORD (Mandatory, default devbox)
- DATABASE_HOST (Mandatory, default devbox)
- DATABASE_PORT(Optional, default  as standard port)
- SECRET_KEY (**Mandatory, container rase an exeption if not defined**)
- BASE_PATH (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- DEBUG (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- CHANGELOG_RETENTION(Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- LOGIN_REQUIRED (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- EMAIL_SERVER (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- EMAIL_PORT (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- EMAIL_USERNAME (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- EMAIL_PASSSWORD (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- EMAIL_TIMEOUT (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- EMAIL_FROM_ADDRESS (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- EMAIL_SUBJECT_PREFIX (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- PEERINGDB_USERNAME (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- PEERINGDB_PASSWORD (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- NAPALM_USERNAME (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- NAPALM_PASSWORD (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- NAPALM_ARGS (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- NAPALM_TIMEOUT (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- PAGINATE_COUNT (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- TIME_ZONE (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- BGPQ3_HOST (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- BGPQ3_SOURCES (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- BGPQ3_ARGS (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- NETBOX_API (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- NETBOX_API_TOKEN (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)
- NETBOX_DEVICE_ROLES (Optional, default as defined at https://peering-manager.readthedocs.io/en/latest/configuration/optional-settings/)

