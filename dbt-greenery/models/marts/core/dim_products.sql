{{
  config(
    materialized='table'
  )
}}

SELECT
  p.product_id,
  p.name,
  p.price,
  p.quantity
FROM {{ ref('stg_products') }} p