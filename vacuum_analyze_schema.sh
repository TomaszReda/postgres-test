PGUSER=$1
PGHOST=$2
PGPORT=$3
PGDB=$4
PGSCHEMA=$5

for table in $(psql -h ${PGHOST} -p ${PGPORT} -d ${PGDB} -U ${PGUSER} -w \
  -c "select tablename from pg_tables where schemaname = '${PGSCHEMA}';" | \
  tail -n +3 | head -n -2); do
    psql -h ${PGHOST} -p ${PGPORT} -d ${PGDB} -U ${PGUSER} \
         -c "VACUUM VERBOSE ANALYZE ${PGSCHEMA}.${table};";
done