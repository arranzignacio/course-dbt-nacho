{{
  config(
    materialized='table'
  )
}}

SELECT
  op.product_name,
  op.product_price,
  op.product_id,
  count(distinct op.order_id) as num_orders,
  count(distinct case when op.promo_id is not null then op.order_id end) as num_orders_with_promo,
  count(distinct op.user_id) as num_purchasers,
  avg(op.product_quantity) as avg_items_per_purchase
FROM {{ ref('int_order_product') }} op
GROUP BY 1, 2, 3