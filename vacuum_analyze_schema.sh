PGUSER=$1
PGPASSWORD=$2
PGHOST=$3
PGPORT=$4
PGDB=$5
PGSCHEMA=$6

for table in $(psql -h ${PGHOST} -p ${PGPORT} -d ${PGDB} -U ${PGUSER} \
  -c "select tablename from pg_tables where schemaname = '${PGSCHEMA}';" | \
  tail -n +3 | head -n -2); do
    psql -h ${PGHOST} -p ${PGPORT} -d ${PGDB} -U ${PGUSER} \
         -c "VACUUM VERBOSE ANALYZE ${PGSCHEMA}.${table};";
done