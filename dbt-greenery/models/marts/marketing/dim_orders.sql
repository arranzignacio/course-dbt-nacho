{{
  config(
    materialized='table'
  )
}}

SELECT
  o.order_id,
  o.promo_id,
  o.user_id,
  o.address_id,
  o.created_at,
  o.order_cost,
  o.shipping_cost,
  o.order_total,
  o.delivered_at,
  p.discount,
  os.sale_amount,
  os.sale_amount*(100-p.discount)/100 AS revenue,
  os.sale_amount*(100-p.discount)/100 - order_total AS margin
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_promos') }} p
ON o.promo_id = p.promo_id
LEFT JOIN {{ ref('int_order_sales') }} os
ON o.order_id = os.order_id