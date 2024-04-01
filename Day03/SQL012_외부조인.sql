select c.custid, 
    c.[name], 
    c.[address], 
    c.phone, 
    o.orderid, 
    o.custid, 
    o.bookid, 
    o.saleprice, 
    o.orderdate
from Customer as c left outer join orders as o
on c.custid= o.custid
    
