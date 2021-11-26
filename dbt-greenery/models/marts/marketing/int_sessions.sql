{{
  config(
    materialized='table'
  )
}}

SELECT
    e.session_id,
    e.user_id,
    COUNT(DISTINCT CASE WHEN event_type = 'add_to_cart' then event_id end) AS add_to_cart,
    COUNT(DISTINCT CASE WHEN event_type = 'checkout' then event_id end) AS checkout,
    COUNT(DISTINCT CASE WHEN event_type = 'package_shipped' then event_id end) AS package_shipped,
    COUNT(DISTINCT CASE WHEN event_type = 'account_created' then event_id end) AS account_created,
    COUNT(DISTINCT CASE WHEN event_type = 'delete_from_cart' then event_id end) AS delete_from_cart
FROM {{ ref('stg_events') }} e
GROUP BY 1, 2