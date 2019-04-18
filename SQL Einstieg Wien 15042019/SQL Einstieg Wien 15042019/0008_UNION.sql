---UNION

--2 oder mehr Abfragen zu einem Ergebnis verknüpfen

select country from customers
UNION
select shipcountry from orders




select country from employees

--es müssen gleich viele Spalten sein
--und kompatibler Datentyp

select country , city from customers
UNION
select shipcountry, 'TXT' from orders


-- guter Kunde A:      < 10 Frachtkosten
-- schlechter Kunde C: mehr als 500 hat
-- der Rest ist B

--Orderid, customerid, Typ, freight
select Orderid, customerid, 'A' as TYP, freight from orders
	where freight < 10
 UNION
select Orderid, customerid, 'C' as Typ, freight from orders
	where freight > 500
 union
select Orderid, customerid, 'B' as Hmm, freight from orders
	where freight between  10 and 500

--die Spalten titel werden in der ersten Abfrage definiert..

 SELECT 'A'
 UNION
 SELECT 'B'


--UNION macht distinct!

 SELECT 'A'
 UNION
 SELECT 'A'


--es gibt keine doppelten oder man möchte die doppelten sehen
--dann verwendet man UNION ALL

select 'A'	  , NULL, 'TXT '
UNION ALL
select 'A'	 , 100, 'ABC'

--umsatzstärkster Kunde
--umsatzschwächster Kunde
--als ein Ergebnis

select top 1 Companyname, sum(unitprice*quantity)
from
		customers c inner join orders o			  on o.CustomerID = c.CustomerID
					inner join [Order Details] od on od.orderid   = o.orderid
group by companyname
order by 2 desc
UNION
select top 1 Companyname, sum(unitprice*quantity)
from
		customers c inner join orders o			  on o.CustomerID = c.CustomerID
					inner join [Order Details] od on od.orderid   = o.orderid
group by companyname
order by 2 asc

--Fehler, da der UNION keine order by in den einzelnen Statments erlaubt
--ALternativen , sprich Workaround

--Variante 1: die Ergebnisse in Tabellen wegschreiben und dann union zwischen den neuen Tabellen
--Variante 2:


select 'A', (select getdate()) as Sp1, 
		(select top 1 freight from orders) ,
		100, customerid
from customers


select * from (select top 100 percent * from orders order by freight ) t1



select * from ##t1







select * from 
	(
	select top 1 Companyname, sum(unitprice*quantity)	 as Summe
	from
			customers c inner join orders o			  on o.CustomerID = c.CustomerID
						inner join [Order Details] od on od.orderid   = o.orderid
	group by companyname
	order by 2 desc
	) t1
UNION ALL
select * from 
	(
	select top 1 Companyname, sum(unitprice*quantity)   as Summe
	from
			customers c inner join orders o			  on o.CustomerID = c.CustomerID
						inner join [Order Details] od on od.orderid   = o.orderid
	group by companyname
	order by 2 asc
	) t2


