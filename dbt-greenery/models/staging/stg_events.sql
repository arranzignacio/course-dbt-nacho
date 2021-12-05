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
    {{ extract_product_id('page_url') }} AS product_id,
    created_at
FROM {{ source('data', 'events') }}