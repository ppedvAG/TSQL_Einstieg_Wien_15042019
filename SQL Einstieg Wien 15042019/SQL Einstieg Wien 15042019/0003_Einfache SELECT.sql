/*
Einfache SELECT

select 
		'txt'
		Zahlen
		F()
		Datum
		Spalten aus Tabellen 
from
		Tabelle
where
	 filtert Datenmenge
order by 
	Spalte

*/


--Immer beachten wo wir gerade sind:

Use northwind;
GO

select * from customers --* für alle Spalten der From Tabellen


--best. Spalten

select customerid, companyname, city, country from customers



select customerid, companyname, city, left(country,2) from customers


--Spalten ohne Namen: Alias
select    customerid, companyname, city
		, left(country,2) as LandKurz 
		, Country as Land
from customers

--Alias: ..und alles andere ebenso..: 
	--keine Leerzeichen im Namen
	--keine Mathesymbole
	--keine Umlaute


select    customerid, companyname, city
		, left(country,2) as LandKurz 
		, Country as Land
from customers
where
	Customerid = 'ALFKI'



select * from orders


--Übersicht über alle Bestellungen (bestNr, BestDatum, Lieferdatum, 
--Diff in Tagen zw Liefer und Bestdatum)

--datediff


select 
		  Orderid
		, Orderdate
		, Shippeddate
		, datediff(dd,orderdate, shippeddate) as Lieferzeit
from 
	orders
order by
	Lieferzeit desc --asc = Default

--welche Bestellungen kamen verzögert an--- alle ausgeben --> sortieren




--"Falsches Ergebnis.. Falsch sortiert..
select 
		  Orderid
		, Shippeddate
		, requireddate
		, datediff(dd,shippeddate, requireddate) as Delayed
from 
	orders
order by
	delayed desc --asc = Default


	
select 
		  Orderid
		, Shippeddate
		, requireddate
		, datediff(dd,requireddate, shippeddate) as Delayed
from 
	orders
order by
	delayed desc --asc = Default

--Nettofrachtkosten.. brauchen aber Brutto : 1.20
select * from orders

--Ausgabe: BestNr, Netto und Brutto Frachkosten und Betrag der MwSt

select		orderid
		  , freight as netto 
		  , freight * 1.2 as Brutto
		  , brutto - netto --??
from orders

-- . vor Strich wird beachtet, aber sicher ist es mit Klammer
select		orderid
		  , freight as netto 
		  , freight * 1.2 as Brutto
		  , (freight * 1.2) - freight as MwST
from orders










