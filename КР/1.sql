select top(3) CUST_NUM, sum(QTY) [���-�� �������]
from ORDERS join CUSTOMERS C on ORDERS.CUST = C.CUST_NUM
where CREDIT_LIMIT<50000
group by CUST_NUM
order by [���-�� �������] desc;

select AVG(AMOUNT/QTY) [������� ����]
from OFFICES join SALESREPS S on OFFICES.OFFICE = S.REP_OFFICE and REGION='Western'
join CUSTOMERS C on S.EMPL_NUM = C.CUST_REP
join ORDERS O on C.CUST_NUM = O.CUST