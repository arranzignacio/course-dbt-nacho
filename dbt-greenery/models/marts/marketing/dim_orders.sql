{{
  config(
    materialized='table'
  )
}}

WITH order_sales AS (
    -- This makes the assumption that prices haven't changed in an inflation free world :)
    SELECT
        oi.order_id,
        SUM(oi.quantity * coalesce(p.price,0)) AS sale_amount
    FROM {{ ref('stg_order_items') }} oi
    LEFT JOIN {{ ref('stg_products') }} p
    ON oi.product_id = p.product_id
    GROUP BY oi.order_id
)

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
LEFT JOIN order_sales os
ON o.order_id = os.order_id