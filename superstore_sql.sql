# 컬럼명 변경
ALTER TABLE superstore CHANGE `customer.id` customer_id varchar(20);
ALTER TABLE superstore CHANGE `customer.name` customer_name varchar(50);
ALTER TABLE superstore CHANGE `order.date` order_date date;
ALTER TABLE superstore CHANGE `order.id` order_id varchar(20);
ALTER TABLE superstore CHANGE `order.priority` order_priority varchar(20);
ALTER TABLE superstore CHANGE `product.id` product_id varchar(20);
ALTER TABLE superstore CHANGE `product.name` product_name varchar(200);
ALTER TABLE superstore CHANGE `row.id` row_id int;
ALTER TABLE superstore CHANGE `ship.date` ship_date date;
ALTER TABLE superstore CHANGE `shipping.cost` shipping_cost varchar(20);
ALTER TABLE superstore CHANGE `sub.category` sub_category varchar(20);

# 호주 vs 중국 연간 매출 비교
SELECT YEAR(ORDER_date), country, sum(sales)
FROM Superstore
WHERE country = 'australia'
OR country = 'china'
GROUP BY 1, 2
ORDER BY 1;

# 호주 vs 중국 연간 이익 비교
SELECT YEAR(ORDER_date), country, round(sum(profit))
FROM Superstore
WHERE country = 'australia'
OR country = 'china'
GROUP BY 1, 2
ORDER BY 1;

# 호주 vs 중국 연간 카테고리별 매출 비교
SELECT YEAR(ORDER_date), category, country, sum(sales)
FROM Superstore
WHERE country = 'australia'
OR country = 'china'
GROUP BY 1, 2, 3
ORDER BY 1;

# 호주 vs 중국 연간 평균 할인율 비교
SELECT YEAR(ORDER_date), country, round(avg(Discount) * 100, 1)
FROM Superstore
WHERE country = 'australia'
OR country = 'china'
GROUP BY 1, 2
ORDER BY 1;

# 호주 vs 중국 카테고리별 할인율 이익 비교
SELECT YEAR(ORDER_date), country, category, round(avg(Discount) * 100, 1), avg(Sales)
FROM Superstore
WHERE country = 'australia'
OR country = 'china'
GROUP BY 1, 2, 3
ORDER BY 1;