
WITH raw_costumers AS (
    SELECT
        customer_id,
        name,
        email,
        phone
    FROM {{ ref('raw','raw_customers') }}
)

SELECT DISTINCT 
    customer_id, 
    name, 
    email, 
    phone
FROM raw_costumers
WHERE customer_id IS NOT NULL 
  AND name IS NOT NULL
  AND email IS NOT NULL 
  AND phone IS NOT NULL

