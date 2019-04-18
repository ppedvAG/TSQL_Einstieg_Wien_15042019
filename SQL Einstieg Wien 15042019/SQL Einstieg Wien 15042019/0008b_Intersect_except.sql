--

select customerid, companyname, country, city into c_alle from customers
select * from c_alle    --91

select customerid, companyname, country, city into c_EU from customers
		where country in ('Italy', 'germany', 'Austria', 'France')
select * from c_eu -- 27 	

select customerid, companyname, country, city from customers


select * from c_alle    --91
select * from c_eu -- 27 	

 update c_alle set City = 'Köln' where customerid = 'ALFKI'

update c_eu set companyname = 'blue lake del' where customerid = 'BLAUS'


--suchen gemeinsame Datensätze zwischen c_alle und c_eu
 --statt einen Join zu schreiben , der alle Spalten im ON vergleiche muss
 --ist der intersect deutlich besser ;-)

 select * from c_alle
 intersect
 select * from c_eu
--statt 27 nun nur noch 25 gemeinsame

  --auch hier 27
 select customerid, country from c_alle
 intersect
 select customerid, country from c_eu

--26
select customerid, city from c_alle
 intersect
 select customerid, city from c_eu

 .--die Reihenfolge spielt keine Rolle.. zuerst c_alle oder c_eu

 --aber jetzt.. die unterschiedlichen Zeilen finden

 select * from c_alle
 except
 select * from c_eu		--66 DS


 select * from c_eu
 except
 select * from c_alle	   --2 DS



 --Customers
 --orders

-- gibts denn Länder in denen Kunden sind, aber keine Lieferungen stattfanden

select country from customers
except
select shipcountry from orders



select shipcountry from orders
except
select country from customers

  --nö!

select city from customers
except
select city from employees

