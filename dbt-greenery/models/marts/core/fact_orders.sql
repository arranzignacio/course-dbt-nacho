{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  o.order_total,
  o.order_cost,
  o.status,
  o.promo_id,
  p.discount AS promo_code_discount,
  o.user_id,
  u.first_name AS user_first_name,
  o.tracking_id,
  os.sale_amount,
  os.sale_amount*(100-p.discount)/100 AS revenue,
  os.sale_amount*(100-p.discount)/100 - order_total AS margin
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_promos') }} p
  ON o.promo_id = p.promo_id
LEFT JOIN {{ ref('stg_users') }} u
  ON o.user_id = u.user_id
LEFT JOIN {{ ref('int_order_sales') }} os
  ON o.order_id = os.order_id