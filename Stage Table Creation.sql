PROC SQL;
CREATE TABLE WORK.query AS
SELECT wq1.customer_id, wq1.employee_id , COUNT(wq1.product_id) AS Product_Count , SUM(wq1.nt_sales) AS Sales
FROM WORK.IMPORT wq1
INNER JOIN (
	SELECT DISTINCT wq1.customer_id, wq1.employee_id, wq1.product_id
	FROM WORK.IMPORT wq1
	WHERE wq1.employee_id IN (1,2,5,6,8,9) /*Account Execs with 3 or fewer Customers*/
) wq2 
ON (
wq1.employee_id = wq2.employee_id
AND
wq1.customer_id = wq2.customer_id
AND
wq1.product_id = wq2.product_id
)
GROUP BY wq1.employee_id, wq1.customer_id
;
RUN;
QUIT;

PROC DATASETS NOLIST NODETAILS;
CONTENTS DATA=WORK.query OUT=WORK.details;
RUN;

PROC PRINT DATA=WORK.details;
RUN;