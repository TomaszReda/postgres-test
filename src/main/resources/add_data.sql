create index if not exists IX_json_test_create_time on test.testowy.json_test (create_time);
create extension if not exists pg_trgm;
create index if not exists IX_GIN_json_test_json on test.testowy.json_test USING gin(JSON public.gin_trgm_ops);



select count(*) as all_records from test.testowy.json_test;

select count(*) before_that_90 from test.testowy.json_test
where create_time >= current_timestamp::DATE - 90;

select count(*) old_that_90 from test.testowy.json_test
where create_time < current_timestamp::DATE - 90;

delete from test.testowy.json_test
where create_time < current_timestamp::DATE - 90;




delete from test.testowy.json_test;
select test.testowy.add_data(generate_series,true) FROM generate_series(0,3);
select test.testowy.add_data(generate_series,false) FROM generate_series(0,270);
