--Aggregate

/*
Sum()
count()
avg()
min()
max()	   

*/

select sum(freight) from orders

select sum(freight), min(freight), max(freight), avg(freight) from orders



select country, count(*) from customers
group by country

select country , city, count(*) from customers
group by   country, city


--Summe der Frachtkosten pro KundenId

select customerid, sum(freight)  as Frachtsumme from orders
group by customerid

--welcher Kunde hatte die höchsten Frachtkosten?


select top 1 customerid, sum(freight)  as Frachtsumme from orders
group by customerid
order by frachtsumme	desc

--was ist die teuerste Rechnung
select * from [Order Details]

select top 1 orderid, sum(unitprice*quantity) from [Order Details]
group by  orderid
order by 2 desc		 --	 17250


select top 1 orderid, sum(unitprice*quantity) from [Order Details]
group by  orderid
order by 2 asc 	    --12.50


--Umsatzstärkster Kunde
--Firma, Umsatz

select top 1 Companyname, sum(unitprice*quantity)
from
		customers c inner join orders o			  on o.CustomerID = c.CustomerID
					inner join [Order Details] od on od.orderid   = o.orderid
group by companyname
order by 2 desc

--geht so nicht
 --nur die Länder, in denen gleich  oder mehr als 10 Kunden sind
select country, count(*) as Anzahl from customers
where anzahl > = 10
group by country 
order by 2 desc

 --Das having ist das where des Group by
--das having sollte nie etwas foltern, was ein where leisten kann
--daher sollte im having nur immer ein Agg zu finden sein

select country, count(*) as Anzahl from customers
--where anzahl > = 10
group by country   having  count(*) >= 10
order by Anzahl desc

--von welchem Produkt haben wir mehr als 1000 Stück verkauft....?

--Was will ich sehen: Produktname, Stückzahl

select p.productname , sum(od.quantity)  As verk_Stueckzahlen
from
	products p 
			inner join [Order Details] od on od.ProductID=p.ProductID
group by p.productname	 having  sum(od.quantity) > 1000
order by verk_Stueckzahlen desc


--WITH CUBE ... WITH ROLLUP
select country, city,count(*) from customers
group by country  ,city 

select country, city,count(*) from customers
group by country  ,city  with rollup
order by 1,2,3

select country, city,count(*) from customers
group by country  ,city  with cube
order by 1,2,3















