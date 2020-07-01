#!/bin/bash
# truncate pr_data_stream_nodes, otherwise in case if pega-prpc-pe was build/started multiple times pega will have multiple
# instances of the same node with the same IP in the database and will faild to start 
( sleep 5 ; echo "truncate data.pr_data_stream_nodes"; psql -U postgres -d postgres -c 'truncate data.pr_data_stream_nodes' ) &
echo "start postgres"
/docker-entrypoint.sh postgres
