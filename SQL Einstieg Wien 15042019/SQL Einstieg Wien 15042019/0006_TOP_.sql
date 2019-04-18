--TOP..DISTINCT


select top ...

--die ersten Zeilen anzeigen

select top 3 * from customers   --ersten 3 zeilen

--top ist eigtl immer mit einem  order by   verbunden	  --> Sinn

select top 10 * from orders	   order by freight	   desc


select top 10 percent * from orders


select top 1 * from orders order by freight desc  --höchsten Frachtkosten


--top 13 nach Frachtkosten aufsteigend sortiert
--wie hoch ist der letzte in der Liste... 	 0.56

  --with ties gibt auch die aus, die an der letzten Stelle identische Werte haben

select top 13 with ties * from orders	order by freight


/*
 select top 3 * from orders
 select top 3 * from region

*/


--doppelte Ergebniszeilen filtern	

select distinct customerid from orders


select distinct customerid, orderid from orders

--Wieviele Länder gibt es in Customers

select distinct country  from customers		 order by 1		 ---21


--wieviele Städte:
select distinct city  from customers		 order by 1		 ---69
