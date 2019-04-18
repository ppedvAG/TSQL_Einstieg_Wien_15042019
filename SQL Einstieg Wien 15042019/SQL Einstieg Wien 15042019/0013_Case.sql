--CASE

/* kann Ergebnisse in der Ausgabe überschreiben
select ..,
	case
		when bedingung then ...
		when bedingung then ...
		...
		else ..
	end

*/

select 
		customerid, country, city,
		case when city = 'Graz' then 'Grazie' end  as LandDE
from customers
where country = 'AUSTRIA'


select 
		customerid, country, city,
		case 
			when city = 'Graz' then 'Grazie'
			when city = 'Fucking' then '*****'
			else 'k.a'		
		end  as LandDE
from customers
 where country = 'AUSTRIA'
--grundsätzlich ist die Bedingung wie ein where zu behandeln
--also auch like oder > möglich

--ABC 
--Frachtkosten > 500  C
--Frachtkosten < 100  A
--Rest B 
--produziert exakt eine Spalte
case
	when freight < 100 then 'A'
	when freight > 500 then 'C'
	else 'B'
end

select orderid, freight, Kundentyp from orders

select orderid, freight, 
	case
		when freight < 100 then 'A'
		when freight > 500 then 'C'
		else 'B'
	end as Kundentyp
from orders





--kann man auch beim Update verwenden
update products set spx = 
							case 
									when unitprice < 10  then '0'
									when unitprice > 100 then 1000
									else 50
							end
select unitprice, spx from products


