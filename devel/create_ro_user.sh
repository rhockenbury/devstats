#!/bin/bash
if [ -z "${PG_PASS}" ]
then
  echo "You need to set PG_PASS environment variable to run this script"
  exit 1
fi

host=`hostname`
if [ $host = "cncftest.io" ]
then
  all="gha prometheus opentracing fluentd linkerd grpc coredns containerd rkt cni envoy jaeger notary tuf rook vitess nats opencontainers allprj cncf"
else
  all="gha prometheus opentracing fluentd linkerd grpc coredns containerd rkt cni envoy jaeger notary tuf rook vitess nats opencontainers allprj"
fi

if [ ! -z "$DROP" ]
then
  sudo -u postgres psql < ./util_sql/drop_ro_user.sql || exit 1
  for proj in $all
  do
    sudo -u postgres psql "$proj" < ./util_sql/drop_ro_user.sql || exit 2
  done
fi

sudo -u postgres psql -c "create user ro_user with password '$PG_PASS'" || exit 3

for proj in $all
do
  ./devel/ro_user_grants.sh "$proj" || exit 4
done
echo 'OK'
