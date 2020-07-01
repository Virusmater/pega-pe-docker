FROM dimakompot/postgres-pljava:latest

# Copy custome initdb & scripts
COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY scripts /scripts
RUN chmod -R +x '/scripts'
