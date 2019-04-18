  --Stored Procedures

  /*
  funktionieren wie Batchdateien
  können aber Parameter ( ~Variable)
  Prozeduren sind nicht mischbar mit Joins zB...

  CREATE .. DROP... ALTER

  create procedure namederproc
  as
  Code

  create proc procname @par int, @par 2 int
  as
  CODE .. der die Parameter wie Variablen verwendet

Prozeduren sind auf dem Server, der adhoc ist in der Anwendung
dh zentrale Verwaltung auf dem Server
wiederverwendbar
i.d.R schneller

Einsatzgebiet
	manche verwenden den sie immer

	die Prozedur kann durchaus sehr umfangreich ausfallen
	dh besteht aus zahlreichen Anweisungen
	



  GO ist ein Batchdelimiter ...



  */


  exec procname

  exec procname 'A', 100


create proc gpRechner @zahl1 int, @zahl2 int
as
select @zahl1 * @zahl2

exec gprechner 10,4


alter proc gprechner @zahl1 int, @zahl2 int, @zahl3 int
as
select @zahl1 + @zahl2 * @zahl3


exec gprechner 100,200,3

drop proc gprechner


create procedure gpBestSuche @land varchar(50), @AngId as int
as
select @land
select * from orders where shipcountry = @Land AND employeeid = @AngId


exec gpBestsuche 'UK', 5


select * from c_alle
 --Lösche alle Kunden eines best Landes... per Prozedur
 --aus Tabelle c_alle

exec gpKundenDel  'Mexico'

create procedure gpKundenDel @Land varchar(50)
as
delete from c_alle where country = @Land

begin tran
select * from c_alle where country = 'Mexico'
exec gpKundendel 'Mexico'
select * from c_alle where country = 'Mexico'
rollback


 --aufgabe ändern: Löschen aus Customers mit einem best FirmenId
 --Customerid


begin tran
select * from customers where customerid = 'ALFKI'
exec gpKundendel 'ALFKI'
select * from customers where customerid = 'ALFKI'
rollback


create proc gpKdordDet @CustId as char(5)
as
select * from [Order Details] 
	where orderid in (	select orderid from orders 
						where 
						customerid = @CustId )

select * from orders where customerid = @CustId
Select * from customers where customerid = @CustId


alter proc gpKundenDel	 @kdid char(5)
as
exec gpkdordDet @kdid

exec gpKundenDel 'ALFKI'


alter proc gpKundenDel @CustId as char(5)
as
exec gpkdordDet @custId
delete from [Order Details] 
		where orderid in (	select orderid from orders 
						where 
						customerid = @CustId )

delete from orders where customerid = @CustId
delete from customers where customerid = @CustId
exec gpKDordDet @CustId


begin tran
exec gpKundendel 'ALFKI'
rollback


alter proc gptest1
as
select getdate()
GO

exec gptest1


--GO 

declare @varx as int = 0
select @varx
 GO
select @varx

select 100
GO 10


--Idee komfortable Suche nach Kunden
alter proc gpKdSuche @kdid varchar(5)='%'    --ALFKI
as
select @kdid +'%'
select 	* from customers
	where
		customerid like @kdid +'%'	 --A%



exec gpKDSuche 'ALFKI' -- 1

exec gpKDSuche 'A' -- 4

exec gpKdSuche  --alle

















