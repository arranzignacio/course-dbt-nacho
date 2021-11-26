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
  o.tracking_id,
  o.shipping_service,
  o.delivered_at,
  o.status,
  oi.product_id,
  p.name as product_name,
  p.price as product_price,
  oi.quantity as product_quantity
FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_order_items') }} oi
  ON o.order_id = oi.order_id
LEFT JOIN {{ ref('stg_products') }} p
  ON oi.product_id = p.product_id