
// 1. Total Values of Transactions by each bank
SELECT SUM(value) AS VALUE, 
CASE WHEN
        (RIGHT
            (LEFT
                (transaction_code,3),1)= '-') = TRUE 
                    THEN LEFT(transaction_code,2)
                        ELSE LEFT(transaction_code,3) END
                            AS BANK
FROM PD2023_WK01
GROUP BY BANK

