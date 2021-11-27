{{
  config(
    materialized='table'
  )
}}

SELECT
  s.session_id,
  s.user_id,
  a.address,
  a.zipcode,
  a.state,
  a.country,
  s.add_to_cart_events,
  s.checkout_events,
  s.package_shipped_events,
  s.account_created_events,
  s.delete_from_cart_events,
  s.session_start,
  s.session_finish
FROM {{ ref('int_sessions') }} s
LEFT JOIN {{ ref('stg_users') }} u
  ON s.user_id = u.user_id
LEFT JOIN {{ ref('stg_addresses') }} a
  ON u.address_id = a.address_id