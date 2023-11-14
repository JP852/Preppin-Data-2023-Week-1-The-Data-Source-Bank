
// 3. Total Values by Bank and Customer Code

SELECT SUM(value) AS VALUE
,CASE WHEN
        (RIGHT
            (LEFT
                (transaction_code,3),1)= '-') = TRUE 
                    THEN LEFT(transaction_code,2)
                        ELSE LEFT(transaction_code,3) END
                            AS BANK
,customer_code
FROM PD2023_WK01
GROUP BY
CASE WHEN
        (RIGHT
            (LEFT
                (transaction_code,3),1)= '-') = TRUE 
                    THEN LEFT(transaction_code,2)
                        ELSE LEFT(transaction_code,3) END
        
,customer_code
ORDER BY VALUE

