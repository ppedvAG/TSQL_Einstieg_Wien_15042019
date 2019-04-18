--Sicht.. View

/*
..eine gemerkte Abfrage
die wie eine Tabellen funktioniert

eine Sicht hat (eigtl) keine Daten!!!


Einsatzgebiet
komplexe Abfragen zu vereinefachen





*/

create view vKundenGer
as
select * from customers where country = 'Germany'

select * from vKundenGer



alter view vAlles
as
select 
			o.freight, od.*, p.productname, r.RegionDescription
			, cat.CategoryName, t.TerritoryDescription, e.lastname
from 
	customers c inner join orders o				  on o.CustomerID=c.CustomerID
				inner join [Order Details] od	  on od.orderid  = o.orderid
				inner join employees e			  on e.EmployeeID= o.employeeid
				inner join EmployeeTerritories et on et.EmployeeID=e.EmployeeID
				inner join Territories t		  on t.TerritoryID= et.TerritoryID
				inner join Region r				  on r.RegionID= t.RegionID
				inner join products p			  on p.ProductID= od.ProductID
				inner join Categories cat		  On cat.CategoryID= p.CategoryID
 --where 
	--	r.RegionDescription = 'Eastern'
		--AND
		--cat.CategoryName    = 'Seafood'
--order by 
	--	e.LastName,p.ProductName


select orderid,lastname  from valles where RegionDescription = 'Eastern'


--lege eine Sicht an, die 
--den Firmenamen, Stadt und Land des Kunden ausgibt
--die Bestnr und Frachtkosten
--den Unitprice und quantity aus Order details
--und den productname

alter view vKundeBestellung
as
select 
		c.companyname, c.city, c.country,
		o.orderid, o.freight,
		od.unitprice * od.quantity as PosSumme,od.unitprice , od.quantity,
		p.productname
from
		customers c inner join orders o			  on c.customerid = o.customerid
					inner join [Order Details] od on od.orderid   = o.orderid
					inner join products p		  on p.productid  = od.productid

select * from vKundeBestellung


select top 1 companyname, sum(possumme) from vKundeBestellung
group by companyname
order by 2 desc






