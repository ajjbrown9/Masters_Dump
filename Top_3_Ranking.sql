PROC SQL;
CREATE TABLE WORK.query AS
SELECT employee_id , sum(Product_Count) AS SalesCount , sum(Sales) AS SalesSum, sum(Sales)/sum(Product_Count) AS Marginal_Revenue
FROM WORK.RANK0001
GROUP BY employee_id
ORDER BY SalesCount DESC
;
RUN;
QUIT;

PROC DATASETS NOLIST NODETAILS;
CONTENTS DATA=WORK.query OUT=WORK.details;
RUN;

PROC PRINT DATA=WORK.details;
RUN;