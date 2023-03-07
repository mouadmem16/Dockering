couchbase-cli cluster-init --cluster 172.16.101.11 --cluster-username admin --cluster-password 123AZE123 \
 --services data,index,query,fts,eventing,analytics,backup \
 --cluster-ramsize 1024 --cluster-index-ramsize 256 \
 --cluster-eventing-ramsize 256 --cluster-fts-ramsize 256 \
 --cluster-analytics-ramsize 1024 --cluster-fts-ramsize 256

couchbase-cli server-add --cluster 172.16.101.11 --username admin --password 123AZE123 \
--server-add couchbase2 --server-add-username admin --server-add-password 123AZE123 \
--services data,index,query,fts,eventing,analytics,backup

couchbase-cli rebalance --cluster 172.16.101.11 --username admin --password 123AZE123

couchbase-cli server-list --cluster 172.16.101.11 --username admin --password 123AZE123


