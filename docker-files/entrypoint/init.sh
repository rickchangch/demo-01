#!/bin/bash
set -e -u

# prepare env
cp .env.${DEPLOY_ENV} .env

# migrate db
php bin/hyperf.php migrate

# start application
case ${DEPLOY_ENV} in
    dev)
        apk add --no-cache protobuf

        # keep it running in the foreground or start server using hot-reload
        exec tail -f /dev/null
        # php bin/hyperf.php server:watch
        ;;
    stage)
        php bin/hyperf.php start
        ;;
    prod)
        php bin/hyperf.php start
        ;;
esac
