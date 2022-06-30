SELECT INTO [INSERT TABLE NAME] (
)
SELECT
	orders.order_id,
	reg.region_id,
	reg.region_description::VARCHAR as description,
	ter.territory_id,
	employee_territories.employee_id,
	employees.last_name,
	employees.first_name,
	products.product_name
FROM "RAW".region reg
LEFT JOIN "RAW".territories ter
	ON (reg.region_id = ter.region_id)
LEFT JOIN "RAW".employee_territories
	ON (ter.territory_id = employee_territories.territory_id)
LEFT JOIN "RAW".employees
	ON (employee_territories.employee_id = employees.employee_id)
LEFT JOIN "RAW".orders
	ON (employees.employee_id = orders.employee_id)
LEFT JOIN "RAW".order_details
	ON (orders.order_id = order_details.order_id)
LEFT JOIN "RAW".products
	ON (order_details.product_id = products.product_id)
WHERE
	employees.employee_id <> 5
	AND
	employees.title IS NOT NULL
ORDER BY employee_territories.employee_id asc;l





--QUERY/READING DATA
-- 1) JOINS
-- 2) Aggregations
-- 3) aliasing
-- 4) CASTING
-- 5) Window Functions
-- 6) CTEs
-- 7) CASE statements
-- 8) DECODES
-- 9) NESTED QUERY

-- WRITING









