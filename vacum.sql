DO $$
    DECLARE
        tab RECORD;
        schemaName VARCHAR := 'public';
    BEGIN
        for tab in (select t.relname::varchar AS table_name
                    FROM pg_class t
                             JOIN pg_namespace n ON n.oid = t.relnamespace
                    WHERE t.relkind = 'r' and n.nspname::varchar = schemaName
                    order by 1)
            LOOP
                RAISE NOTICE 'ANALYZE verbose %.%', schemaName, tab.table_name;
                EXECUTE format('ANALYZE verbose %I.%I', schemaName, tab.table_name);
                RAISE NOTICE '-------------------------';
            end loop;
    end
$$;

vacuum  verbose analyse  public.json_test;
