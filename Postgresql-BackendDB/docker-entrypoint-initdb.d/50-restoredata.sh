#! /bin/sh

#Script to restore data from /tmp/resources/pega.dump

PEGA_DUMP="/resources/pega.dump"

if [ -f "$PEGA_DUMP" ];then
    # restore contents from pega.dump into pega database
    echo "Restoring /resources/pega.dump... This might take few minutes"
    pg_restore -v --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -O "$PEGA_DUMP"
    echo "Restoring pega.dump Complete!"

else
    #pega.dump is not specified in docker run / docker-compose
    echo "$PEGA_DUMP file not found. Please make sure this file is present, and run again"
    #postgresql will create a default db, so this has to be removed.
    rm -rf "$PGDATA"/*
    exit 1
fi