--Where

--wichtigste eines Codes

--Vergleichsparameter
/*
 =   exakter Vergleich--> keine Wildcards
 >  Wert (Zahlen oder auch Buchstaben und Datum)
 <  Wert
 >=
 <=
 <>  das soll es nicht sein
 !=   "         "
 like .. kennt Wildcards
 in   ..Vergleich mit Auflistung
 between .. Suche nach Bereichen

 

*/




-- = 

--suche nach der BestellNummer 10248
select * from orders where orderid = 10248

--Wieviele Best kommen aus Graz

select orderid
from orders
where
		shipcity = 'graz'


--wieviele Bestellungen haben Frachtkosten  zwischen 50 und 100

select orderid
from orders
where
		freight > 50 and freight < 100

--kürzer mit Between

select orderid
from orders
where freight between 50 and 100 --falsch
--between ist identisch mit
--freight >= 50 and freight <= 100


--alle Bestellungen die aus einem Land kommen
--das mit G anfängt beim ersten Buchstaben

select orderid, shipcountry, left(shipcountry, 1)
from orders
where
	left(shipcountry,1) = 'G'

--Liste alle Bestellungen auf, die verzögert zugestellt wurden


select orderid, datediff(dd,  requireddate,shippeddate) as Verz
--	  , shippeddate, requireddate 		
from orders
where  datediff(dd,  requireddate,shippeddate)> 0
order by  2 desc --asc 2.Spalte

--oder so....
select * from orders
where shippeddate > requireddate

--Alle Bestellungen aus
--Cork, Oulu, Salzburg, Graz
--etwas aufwendig...
select orderid, shipcity, shipcountry
from 
	orders
where
	shipcity = 'Cork' 
	or
	shipcity = 'Salzburg' 
	or
	shipcity = 'Oulu' 
	or
	shipcity = 'Graz' 


--einfacher


select * from orders
where
	shipcity in ('Graz', 'salzburg','Oulu', 'cork')
	order by shipcity
	
--Wildcard: % steht für beliebig viele unbekannte Zeichen
-- A%      %A

select orderid, shipcountry, left(shipcountry, 1)
from orders
where
	shipcountry like 'G%'
	--statt left(shipcountry,1) = 'G'

--suche alle Bestellungen, die aus einer Stadt kommen, die ein y enthalten

select orderid, shipcity 
from orders
where 
	shipcity like '%y%'

--Suche nach den Kunden, die ein % im Firmennamen haben....

select * from customers
where
	companyname like '%%%' --alle ?!!!

--alle Tabellen einer DB
select * from sys.tables
--
--alle Zeilen der Order details

select * from [Order Details]

--[] "Wertebereich"

select * from customers where companyname like '[%]' --kein Ergebnis

--%[ou]% --ergibt was?
select * from customers where companyname like '%[ou]%'
--wat macht [ou]?  ---> entder o oder u 

--suche nach allen Firmen, die mit a bis e beginnen
--und mit s-u enden

select * from customers where companyname like '[abcde]%[stu]'
--kürzer gehts so

select * from customers where companyname like '[a-e]%[s-u]'

--[] steht für genau ein Zeichen!!
--wie würde die Prüfung auf ein PIN aussehen?
--..where pin like '[0-9][0-9][0-9][0-9]'

--Suche nach ' 
--blöd weil ..   
select * from customers where companyname like '%[']%''

select * from customers where companyname like '%''%'--Escape Zeichen 

0?7?2476??3?5


'ALF?I'

--die Wildcard für ein Zeichen genau ist: _
--Suchen nach Firmen , deren vorletzter Buchstabe unbkannt ist
--aber der letzte ist ein e und der drittletzte ist ein s

--....s?e'

select * from customers where companyname like '%s_e'

--Verneinen

--where sp != Wert
--where sp not like 'Wert'

--Spezialfall

--DIE NULL!!

--Suche alle Datensätze , die null sind
--dann alle die nicht NULL sind
--Suche in Region (customers)

select * from customers where region is NULL --60 Zeilen -- von 91
select * from customers where region is not null --31

--Krux..immer leeres Ergebnis
select * from customers where region >  null 
















select * from customers where companyname like '%[%]%'




