create table ruchina_np_restoran1
(ordernum number(8),
orderdate varchar2(20),
itemname varchar2(50),
qty number(6),
productprice NUMBER(8,2),
totalprod number(6))

create table ruchina_np_restoran2
(ordernum number(8),
orderdate varchar2(20),
itemname varchar2(50),
qty number(6),
productprice NUMBER(8,2),
totalprod number(6))


create or replace view ruchina_np_days
(dateorder, restoran, countorder, summorder) as
select to_date(substr(orderdate,1,10),'dd.mm.yyyy') as dateorder, 1 as restoran, count(ordernum) as countorder, sum(productprice*qty)
from ruchina_np_restoran1 
group by to_date(substr(orderdate,1,10),'dd.mm.yyyy')
union
select to_date(substr(orderdate,1,10),'dd.mm.yyyy') as dateorder, 2 as restoran, count(ordernum) as countorder, sum(productprice*qty)
from ruchina_np_restoran2
group by to_date(substr(orderdate,1,10),'dd.mm.yyyy')


create or replace view ruchina_np_month
(dateorder, restoran, countorder, summorder) as
select substr(orderdate,4,7) as dateorder, 1 as restoran, count(ordernum) as countorder, sum(productprice*qty)
from ruchina_np_restoran1 
group by substr(orderdate,4,7)
union
select substr(orderdate,4,7) as dateorder, 2 as restoran, count(ordernum) as countorder, sum(productprice*qty)
from ruchina_np_restoran2
group by substr(orderdate,4,7)



