1. 
dbt=# select count(*) from dbt.dbt_nacho.stg_users;
 count 
-------
   130
(1 row)

2.
dbt=# select count(*)/(EXTRACT(EPOCH FROM max(created_at)-min(created_at))/3600) from dbt.dbt_nacho.stg_orders;
     ?column?      
-------------------
 8.346326167471352
(1 row)

3.
dbt=# select avg(extract(epoch from delivered_at - created_at)/3600) from dbt.dbt_nacho.stg_orders where delivered_at is not null;
        avg        
-------------------
 94.21958456973294
(1 row)

4.
dbt=# select a.orders, count(a.*) as num_users from (select user_id, count(*) as orders from dbt.dbt_nacho.stg_orders group by 1) a group by 1 order by 1 asc limit 10;
 orders | num_users 
--------+-----------
      1 |        25
      2 |        22
      3 |        32
      4 |        25
      5 |        15
      6 |         4
      7 |         4
      8 |         1
(8 rows)

5.
dbt=# select count(distinct session_id)/(EXTRACT(EPOCH FROM max(created_at)-min(created_at))/3600) as unique_sessions_per_hour from dbt.dbt_nacho.stg_events;
 unique_sessions_per_hour 
--------------------------
      0.11394811744072095
(1 row)