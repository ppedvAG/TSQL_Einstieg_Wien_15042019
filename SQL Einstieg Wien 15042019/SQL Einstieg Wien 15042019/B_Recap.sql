/*
SELECT 
		TOP 3 (percent) | with ties
		Distinct (filtert doppelte Ergennissezeilen aus)
		*
		f() as ALIAS,
		AGGREGATE (AVG, MIN, MAX, SUM, COUNT)
		Mathe,
		'TEXT' und Zahlen,
		Spalten,
		(select ...) -- es darf nur ein! Wert sein
from
		Tab1 inner|right|left join Tab2 on Tab1.sp = Tab2.sp
			 inner|right|left join Tab3 on Tab1.sp = Tab3.sp
			 ...
			inner join (select ...) t1	  on t1.sp = Tab2.sp
			..
where
		sp = > < between in like (Wildcards) != <> is null
		AND
		sp = > < between in like (Wildcards) != <> is null
		OR
		sp = > < between in like (Wildcards) != <> is null
		AND 
		SP in (Select ....)    -- Auflisten; eine Spalte
		OR
		SP = (Select ..) --darf nur ein Wert sein	
group by 
		Spalten des Select  (Ausnahme: keine Aggregate)
				
having 			--tu nie etwas im group by filtern, was ein where könnte
		AGG > < Wert(aus dem Select)  
order by
		sp1 desc | asc
UNION | ALL  (Abfragen kombinieren)
SELECT ..
INTERSECT  (die gemeinsamen Datensätze)
SELECT...
EXCEPT	  (welche sind in der ersten aber nicht in der zweiten Abfrage)
SELECT ..

*/

--Welcher Angstellte war der fleissigste?

--Lastname, Umsatz (unitprice, quantity aus Order details)

select  top 1 
		e.LastName, sum((od.UnitPrice*od.Quantity)) as Umsatz
from employees e inner join orders o on o.EmployeeID=e.EmployeeID
				 inner join [Order Details] od on od.orderid=o.orderid
 group by 
		e.lastname
order by Umsatz desc

---Liste aller Bestellungen
--Ausgabe: BestNr, Freight , und Abw der Fracht vom Schnitt	der Frachtkosten





--geht nicht
select orderid, freight, avg(freight)	as Frachtkosten	 ,
		(freight- avg(freight)) 	   as Abweichung
 from orders
--group by orderid, freight


 --aber so schon:
select ( select avg(freight) from orders ) , freight from orders




select orderid, freight,
		freight-
		(select  avg(freight)	from orders) as Frachtkostenabweichung	 
 from orders




--Update alle Preise in Products, die Seafood sind
--+ 10% 

begin tran
delete from c_alle
select * from c_alle
delete from c_eu
select * from c_eu
rollback				 --rückgängig |commit , dann fix


begin tran

update products set unitprice = unitprice*1.1
--select p.productname, c.CategoryName , p.UnitPrice
	from 
		products p inner join categories c on c.CategoryID=p.CategoryID
where 
		c.CategoryName = 'Seafood'

rollback

 --oder eher so?

 select CategoryID  into #txy from categories where CategoryName like 'Seafood'

select * from #txy

update products set unitprice = unitprice *1.1
--select * 
from products 
where CategoryID =  ( select * from #txy )






declare @schnitt as money
select @schnitt=avg(freight) from orders

select orderid, freight, @schnitt, @schnitt-freight from orders


update products set unitprice = unitprice *1.1
--select * 
from products 
where CategoryID =  ( select CategoryID  from categories
						where CategoryName like 'Seafood' )



update products set unitprice = unitprice *1.1
--select * 
from products where CategoryID =  (select * from #txy)



















