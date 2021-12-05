### What is our overall conversion rate?

dbt=# select 1.0*count(case when checkout_events > 0 then 1 end)/count(*) as conversion_rate from dbt.dbt_nacho.fact_sessions;
    conversion_rate     
------------------------
 0.32976092333058532564


### What is our conversion rate by product?
select product_name, 1.0*count(case when checkout_events > 0 then 1 end)/count(*) as conversion_rate from dbt.dbt_nacho.fact_product_sessions group by 1 order by 2 desc;
