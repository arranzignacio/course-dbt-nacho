{{
  config(
    materialized='table'
  )
}}

-- This makes the assumption that prices haven't changed in an inflation free world :)
SELECT
    oi.order_id,
    SUM(oi.quantity * coalesce(p.price,0)) AS sale_amount
FROM {{ ref('stg_order_items') }} oi
LEFT JOIN {{ ref('stg_products') }} p
ON oi.product_id = p.product_id
GROUP BY oi.order_id