{{
  config(
    materialized='table'
  )
}}

SELECT
  ps.session_id,
  ps.user_id,
  ps.product_id,
  p.name AS product_name,
  a.address,
  a.zipcode,
  a.state,
  a.country,
  ps.add_to_cart_events,
  ps.checkout_events,
  ps.package_shipped_events,
  ps.account_created_events,
  ps.delete_from_cart_events,
  ps.session_start,
  ps.session_finish
FROM {{ ref('int_product_sessions') }} ps
LEFT JOIN {{ ref('stg_users') }} u
  ON ps.user_id = u.user_id
LEFT JOIN {{ ref('stg_addresses') }} a
  ON u.address_id = a.address_id
LEFT JOIN {{ ref('stg_products') }} p
  ON ps.product_id = p.product_id