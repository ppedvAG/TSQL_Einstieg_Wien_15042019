-- Function

/*

sind vielfältig einsetzbar
machen den Code überscihtlich 
sind praktisch
sind besch** langsam	 (meist)

select f(spalte)
from f(wert)
where
f(Sp) > f(wert)

*/

alter function fDemo (@zahl1 int, @zahl2 int)
returns int
as
	begin
	   return (select @zahl1 * @zahl2)
	end;
GO

--muss mit Schema (dbo) aufgerufen werden
select dbo.fDemo(100,10);
GO


--Erstelle FUnktion, die den Bruttowert errechnet

create function  fBrutto (@netto as money)
returns money
as
	begin
		return (select  @netto *1.2)
	end;
GO


select dbo.fbrutto(freight) as Brutto, freight as netto from orders;
GO

--oder so

select * from orders
	where dbo.fbrutto(freight) > 100;
GO

--Function für RngSumme
--select dbo.fRngSumme(@Oid int)

create function fRngSumme (@oid int)
returns money
as
	begin
		return (select sum(unitprice*quantity) from [Order Details]
				where orderid = @oid)
	end
GO

select dbo.fRngSumme(orderid) as RngSumme, orderid, freight
from orders

--oder

select dbo.fRngSumme(orderid) as RngSumme,
		 *
from 
		orders 
where 
		dbo.fRngSumme(orderid) > 1000
order by rngsumme;
GO

--praktisch , oder?
select customerid, sum(dbo.fRngSumme(orderid)) as RngSumme
from orders
group by customerid
order by RngSumme


alter table orders add RngSumme as dbo.fRngSumme(orderid)

select * from orders where rngsumme > 100

