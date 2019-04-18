--JOIN
/*
select *
FROM 
		TAB1 inner|left|right JOIN TAB2 
		      ON TAB1.sp = TAB2.Sp
*/
		--der häufigste Fall : inner join

select * from 
	customers inner join orders
			  ON customers.customerid = orders.customerid

--günstigere Schreibweise
--Alias für Tabellen
select c.CompanyName, o.OrderID, o.OrderDate
from 
		customers  c inner join orders o
						ON	c.customerid = o.customerid

--welcher Angstellte hatte welche Frachtkosten	
--Liste Nachname, bestnr , Frachtkosten
--von allen Bestellungen deren Frachtkosten über 500 sind

--Tabellen orders und Employees
--join über Emplyoeeid

select o.orderid, o.Freight, e.LastName from
	orders o inner join employees e
			ON o.EmployeeID=e.employeeid
where o.Freight > 500

--Liste alle verkauften Produkte und deren Namen
---und deren Bestellnummern sowie Menge

select od.OrderID, od.Quantity, p.ProductName
from products p inner join [order details] od
ON od.ProductID= p.ProductID

--mehr Tabellen
/*
select Spalten...
from 
		TAB1 inner join TAB2 on TAB1.sp = TAB2.sp
			 inner join TAB3 on Tab3.sp = TAB2.sp
			 inner join TAB4 on Tab4.sp = TAB3.sp
			 inner join TAB5 on Tab5.sp = TAB2.sp
*/
--Firma, Bestnr, Frachtkosten, menge, Verkaufspreis
--produktname

select	  companyname				--Kundentabelle
		, o.orderid	, o.freight		--Bestelltabelle
		, od.quantity, od.unitprice --Bestdetails
		, p.productname				--Produkttablle
from 
			   customers c 
	inner join orders o			  on c.customerid = o.customerid
	inner join [Order Details] od on od.orderid = o.orderid
	inner join products p         on p.productid = od.productid;
GO


--nenne mir alle Kunden und Angstellten,
--die am gleichen Ort sind

select 
		c.companyname as Firma, c.city as KundenStadt,
		e.lastname as Angestellter, e.city as AngestellterWohnort
from
					   customers c 
			inner join employees e on c.city = e.city

--Liste aller Angestellten mit deren pot Stellvertreter
--sie müssen in der gleichen Stadt wohnen

select 
		e.lastname, e2.lastname, e.city, e2.city
from 
		employees e inner join employees e2  on e.city=e2.city
where 
	e.lastname != e2.lastname
order by e.lastname








--select * from employees
	




