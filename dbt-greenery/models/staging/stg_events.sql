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
    CASE WHEN position('https://greenary.com/product/' in page_url)>0 THEN
      replace(page_url,'https://greenary.com/product/','') END AS product_id,
    created_at
FROM {{ source('data', 'events') }}