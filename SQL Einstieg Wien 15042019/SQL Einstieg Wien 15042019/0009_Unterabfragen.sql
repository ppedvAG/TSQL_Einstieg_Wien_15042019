--Unterabfragen können an verschiedensten Stellen in einem Code untergrbacht werden
--gut oder schlecht mal dahingestellt

--IM SELECT
--dann darf des Subselect nur einen Wert zurückgeben
select customerid, (select avg(freight) from orders) as Schnitt from customers

--IM FROM
--das Ergebnis des SUBSelect muss benannt sein
--alle Spalten müssen benannt sein

select * from (select orderid, sum(freight) as Summefracht
from orders group by orderid) t1

--IM WHERE
--es darf aber nur eine Spalte zurückgegeben werden
select * from customers
	where country in (select country from employees)


select * from customers
	where country = (select top 1 country from employees)


--Suche nach allen Kunden, die nix gekauft haben
select 'wir haben nix gekauft. Wir sind Looser! '+ customerid from customers
	where 
			customerid not in (select customerid from orders)






