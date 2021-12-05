{{
  config(
    materialized='table'
  )
}}

SELECT 
    event_id,
    session_id,
    user_id,
    event_type,
    page_url,
    replace(page_url,'https://greenary.com/product/','') AS product_id,
    created_at
FROM {{ source('data', 'events') }}