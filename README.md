# Preppin_Data-2023-Week-1-The-Data-Source-Bank

![image](https://github.com/JP852/Preppin-Data-2023-Week-1-The-Data-Source-Bank/assets/142391590/aa9fe063-1f72-4bbb-b2cd-f5fb988cd87f)

## Link to Challenge

https://preppindata.blogspot.com/2023/01/2023-week-1-data-source-bank.html

## SQL Techniques Used

- Aggregation
- Group By
- Order By
- Left Function
- Right Function
- To_Date Function

## Questions

### Question 1 - Total Values of Transactions by each bank

```
SELECT 
    SUM(value) AS VALUE
    ,CASE WHEN(RIGHT(LEFT(transaction_code,3),1)= '-') = TRUE THEN LEFT(transaction_code,2) ELSE LEFT(transaction_code,3) END AS BANK
        FROM PD2023_WK01
            GROUP BY BANK

```

### Question 2 - Total Values by Bank, Day of the Week and Type of Transaction (Online or In-Person)

```
SELECT 
    SUM(value) AS VALUE
    ,CASE WHEN(RIGHT(LEFT(transaction_code,3),1)= '-') = TRUE THEN LEFT(transaction_code,2)ELSE LEFT(transaction_code,3) END AS BANK
    ,DAYNAME(TO_DATE(LEFT(transaction_date,10),'DD/MM/YYYY' )) AS transaction_date
    ,(CASE WHEN ONLINE_OR_IN_PERSON = 1 THEN 'Online' ELSE 'In-Person' END) AS online_or_in_person  
        FROM PD2023_WK01
            GROUP BY CASE WHEN(RIGHT(LEFT(transaction_code,3),1)= '-') = TRUE THEN LEFT(transaction_code,2)ELSE LEFT(transaction_code,3) END
            ,DAYNAME(TO_DATE(LEFT(transaction_date,10),'DD/MM/YYYY' ))
            ,(CASE WHEN ONLINE_OR_IN_PERSON = 1 THEN 'Online' ELSE 'In-Person' END)
                ORDER BY VALUE

```

### Question 3 - Total Values by Bank and Customer Code

```
SELECT 
    SUM(value) AS VALUE
    ,CASE WHEN(RIGHT(LEFT(transaction_code,3),1)= '-') = TRUE THEN LEFT(transaction_code,2)ELSE LEFT(transaction_code,3) END AS BANK
    ,customer_code
        FROM PD2023_WK01
            GROUP BY CASE WHEN(RIGHT(LEFT(transaction_code,3),1)= '-') = TRUE THEN LEFT(transaction_code,2)ELSE LEFT(transaction_code,3) END
            ,customer_code
                ORDER BY VALUE

```

















