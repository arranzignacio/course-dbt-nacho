### What is our overall conversion rate?

dbt=# select 1.0*count(case when checkout_events > 0 then 1 end)/count(*) as conversion_rate from dbt.dbt_nacho.fact_sessions;
    conversion_rate     
------------------------
 0.32976092333058532564


### What is our conversion rate by product?
dbt=# select product_name, 1.0*count(case when add_to_cart_events - delete_from_cart_events> 0 then 1 end)/count(*) as product_conversion_rate from dbt.dbt_nacho.fact_product_sessions group by 1 order by 2 desc;

    product_name     | product_conversion_rate 
---------------------+-------------------------
 Angel Wings Begonia |  0.66666666666666666667
 Pink Anthurium      |  0.62500000000000000000
 Ficus               |  0.61016949152542372881
 Calathea Makoyana   |  0.60784313725490196078
 Majesty Palm        |  0.60655737704918032787
 Aloe Vera           |  0.60000000000000000000
 Fiddle Leaf Fig     |  0.59183673469387755102
 Philodendron        |  0.58620689655172413793
 Pilea Peperomioides |  0.57894736842105263158
 Jade Plant          |  0.57142857142857142857
 ZZ Plant            |  0.56521739130434782609
 Bird of Paradise    |  0.55932203389830508475
 Snake Plant         |  0.55932203389830508475
 Ponytail Palm       |  0.55555555555555555556
 Rubber Plant        |  0.55555555555555555556
 Arrow Head          |  0.54794520547945205479
 Boston Fern         |  0.54716981132075471698
 Orchid              |  0.54545454545454545455
 Birds Nest Fern     |  0.53968253968253968254
 Dragon Tree         |  0.53846153846153846154
 Monstera            |  0.52941176470588235294
 Cactus              |  0.52459016393442622951
 Bamboo              |  0.52112676056338028169
 Alocasia Polly      |  0.52000000000000000000
 String of pearls    |  0.51898734177215189873
 Devil's Ivy         |  0.50000000000000000000
 Money Tree          |  0.50000000000000000000
Spider Plant        |  0.50000000000000000000
 Pothos              |  0.48000000000000000000
 Peace Lily          |  0.45000000000000000000


 ### Create a macro to simplify part of a model(s).
 See extract_product_id.sql

 ### Create a macro that would be used as a run-operation and explain the use case

 
 ### Add a post hook to your project to apply grants to the role “reporting“


 ### Install a package (i.e. dbt-utils, dbt-expectations) and apply one or more of the macros to your project
Installed dbt utils, used star macro on dim users (not my proudest use of a macro).

