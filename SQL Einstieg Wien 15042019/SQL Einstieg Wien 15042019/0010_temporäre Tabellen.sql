--temporäre Tabellen

/*
beginnen immer mit einer #
select * from #t1

nur bestimmte Zeit existent
und wer kann zugreifen



es gibt aber 2 Sorten


# : lokale temp. Tabelle     99% aller Fäle vermutlich 
	existert nur bis die Verbindung geschlossen wird
	oder sie wird vom Ersteller gelöscht

	nur der Ersteller kann sie verwenden und auch nur in der einen Verbindung, wo sie erstellt wurde


##: globale temp. Tabelle
	existiert auch für andere Verbindungen
	bis sie vom Ersteller gelöscht wird 
	der Ersteller die Verbidung schliesst
	 bestehende laufende Abfragen werden aber nicht unterbrochen



 --Einsatzgebiet: 
 --Zwischenergebnisse um den Code zu vereinfachen

 --aus Performancegründen: immer wieder auf des selber Ergebni zurückgreifen müssen
	---aber nicht immer die 10 MIO Daten abfragen wollen

 */



select * into #t1 from employees

select * from #t1

select * into ##t1 from employees

select country, city,count(*) as Anzahl into #tcust from customers
group by country  ,city  with rollup
order by 1,2,3


select * from #tcust


--bester und schlechtester Kunde mit temp Tabellen


select top 1 Companyname, sum(unitprice*quantity)  as Umsatz into #tbest
from
		customers c inner join orders o			  on o.CustomerID = c.CustomerID
					inner join [Order Details] od on od.orderid   = o.orderid
group by companyname
order by 2 desc

select top 1 Companyname, sum(unitprice*quantity)  as Umsatz into #tmies
from
		customers c inner join orders o			  on o.CustomerID = c.CustomerID
					inner join [Order Details] od on od.orderid   = o.orderid
group by companyname
order by 2 asc



select 'braver Kunde ' , * from #tbest
union all
select 'doofer Kunde ' ,* from #tmies