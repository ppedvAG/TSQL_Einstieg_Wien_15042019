--INS

--bestehende Datensätze in eine best. Tabelle einfügen

--Best. DS in noch nicht existente Tabellen 


--select .....   into Zieltabelle from ... where ...
--alle Spalten müssen einen Namen haben (berechnet Spalten zb..)

select top 10 * 
into top10fracht100tab
from orders where freight > 100 order by freight


select 2*3 as Sp1 into tabdemo

--Aufpassen auf Datentypen

--der select into from  kopiert auch Datentypen mit und Identity Werte

select 'A' as Sp1 into tabdemo2
--hier liegt aber kein Datetyo zu Grunde
--hier fängt SQL Server an zu schätzen..  varchar(1)

exec sp_help	 'tabdemo3'

--was wäre besser... ? 

--convert

select convert(varchar(50),'A')	as sp1	into tabdemo3 

--neue Datensätze in bestehende Tabelle

select * from c_eu

insert into c_eu (customerid, companyname, country, city)
values
				('PPEDV', 'ppedv AG', 'Germany', 'Bgh')

--sofern eh alle Spalten gefüllt werden 
--und das auch noch in der richtigen Reihenfolge

insert into c_eu
values
		('PPED2', 'ppedv gmbh', 'Austria', 'Vienna')


--falls mehrere DS eingefügt werden sollten, dann einfach mit Komma separieren

insert into c_eu
values
		('PPED2', 'ppedv gmbh', 'Austria', 'Vienna'),
		('PPED3', 'ppedv gmbh', 'Austria', 'Vienna'),
		('PPED4', 'ppedv gmbh', 'Austria', 'Vienna') --usw

 --fügt in Customers eure eigene Firma ein...
 --

 
--best. DS in best Tabelle

insert into tabelle (spalten..)
select ...


insert into c_eu --(Spalten der Reihe nach benennen. Falls alle befüllte werden....)
select customerid, companyname, country, city from customers where customerid = 'PPEDV'
					  

--neue Werte in best Tabelle

insert into customers (Customerid, city     , country,  companyname)
values
					  ('PPEDV'  , 'Fucking', 'Austria', 'ppedv AG')

--Alternativ
insert into c_eu
select 'pped6', 'ppedv ag', 'Germany', 'Burghausen'
UNION ALL
select 'pped7', 'ppedv ag', 'Germany', 'Burghausen'
UNION ALL
select 'pped8', 'ppedv ag', 'Germany', 'Burghausen'



--UPDATE


update tabelle set sp = Wert   --bei NULL in diesem Fall auch = NULL
	where spx = wert


select * into o1 from orders --Kopie der Orders


select * from o1

update o1 set shipname = 'XYZ' where orderid = 10248

update o1 set shipcity = 'Vienna', 		shipcountry = 'AUSTRIA'
	where orderid = 10248


--Alle Frachtkosten um 10 % erhöhen, die aus UK verschifft werden
update o1 set freight = freight*1.1
	where shipcountry = 'UK'

--Erhöhe die Frachtkosten um 10% bei den Bestellungen in o1
-- bei denen eine Kunde aus  USA stammt

/*       
		 ANLEITUNG FÜR UPDATE MIT JOIN

*/
--zuerst Abfrage um zu sehen, was erhöht wird
select * from customers c inner join o1 on o1.CustomerID= c.CustomerID
where c.country = 'USA'

--jetzt Code formatieren
--FROM und Rest in nächste Zeile
select * 
from customers c inner join o1 on o1.CustomerID= c.CustomerID
where c.country = 'USA'


--nun das update drüber schreiben
update o1 set freight = freight * 1.1


--und dann den select * auskommentieren fertig

update o1 set freight = freight * 1.1
--select * 
from customers c inner join o1 on o1.CustomerID= c.CustomerID
where c.country = 'USA'



--Ändere die C_alle so, dass im Firmenname das Shipcountry angehängt wird
--aber nur dort , wo der Ang Nr 5 beteiligt war


select * from c_alle c inner join orders o on c.customerid = o.customerid 
where employeeid = 5


select distinct companyname from c_alle c inner join orders o on c.customerid = o.customerid 
where employeeid = 5


update c_alle set companyname = companyname + '_' + upper(left(o.shipcountry ,2) )
 from c_alle c inner join orders o on c.customerid = o.customerid 
where employeeid = 5


--DELETE
--löschen von Zeilen

delete tabelle where sp = Wert
delete from tabelle where sp = wert

select * from o1
delete from o1 where orderid = 10248


--lösche aus c_alle alle Kunden, die höhere Frachtkosten in o1 haben als 500...

 --wie gehabt: zuerst Abfrage...

select * from 
		c_alle c 
				inner join o1 on o1.customerid = c.customerid
		where 
			o1.freight > 500

--wieviel sind es wirklich?

select distinct c.customerid from 
		c_alle c 
				inner join o1 on o1.customerid = c.customerid
		where 
			o1.freight > 500



 delete from c_alle
--select distinct c.customerid
from 
		c_alle c 
				inner join o1 on o1.customerid = c.customerid
		where 
			o1.freight > 500


Select top 1 * from c_alle

--lösche die Stadt...
 --dat ist ein update ;-)
update c_alle set city = NULL where customerid = 'ALFKI'










