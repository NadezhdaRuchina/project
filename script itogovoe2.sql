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

create table ruchina_np_svoddays
(dateorder date,
restoran number(6),
countorder number(8),
summorder NUMBER(8,2))

create table ruchina_np_svodmonth
(dateorder VARCHAR(20),
restoran number(6),
countorder number(8),
summorder NUMBER(8,2))

create or replace procedure make_agr_days
is
begin
insert into ruchina_np_svoddays(dateorder, restoran, countorder, summorder)
select to_date(substr(a.orderdate,1,10),'dd.mm.yyyy') as dateorder, 1 as restoran, count(a.ordernum) as countorder, sum(a.productprice*a.qty)
from ruchina_np_restoran1 a
group by to_date(substr(a.orderdate,1,10),'dd.mm.yyyy')
union
select to_date(substr(b.orderdate,1,10),'dd.mm.yyyy') as dateorder, 2 as restoran, count(b.ordernum) as countorder, sum(b.productprice*b.qty)
from ruchina_np_restoran2 b
group by to_date(substr(b.orderdate,1,10),'dd.mm.yyyy');
commit;
end;

create or replace procedure make_agr_month
is
begin
insert into ruchina_np_svodmonth(dateorder, restoran, countorder, summorder)
select substr(orderdate,4,7) as dateorder, 1 as restoran, count(ordernum) as countorder, sum(productprice*qty)
from ruchina_np_restoran1 
group by substr(orderdate,4,7)
union
select substr(orderdate,4,7) as dateorder, 2 as restoran, count(ordernum) as countorder, sum(productprice*qty)
from ruchina_np_restoran2
group by substr(orderdate,4,7);
commit;
end;

select * from ruchina_np_svoddays

begin
make_agr_days;
end;

begin
make_agr_month;
end;

select * from ruchina_np_svodmonth