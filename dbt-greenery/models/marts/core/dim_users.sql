{{
  config(
    materialized='table'
  )
}}

SELECT
  {{ dbt_utils.star(from=ref('stg_users'), except=["updated_at","address_id"]) }},
  -- u.user_id,
  -- u.email,
  -- u.first_name,
  -- u.last_name,
  -- u.phone_number,
  -- DATE(u.created_at) AS registered_date,
  -- u.address_id,
  u.address_id,
  a.address,
  a.zipcode,
  a.state,
  a.country
FROM {{ ref('stg_users') }} u
LEFT JOIN {{ ref('stg_addresses') }} a
  ON u.address_id = a.address_id