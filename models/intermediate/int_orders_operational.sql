SELECT
orders_id
, date_date
, round(margin + shipping_fee - logcost - ship_cost, 2) as operational_margin
, quantity
, revenue
, purchase_cost
, margin
, shipping_fee
, logcost
, ship_cost
FROM {{ ref("int_orders_margin") }}
left join {{ ref("stg_raw__ship") }}
using(orders_id)
order by orders_id desc