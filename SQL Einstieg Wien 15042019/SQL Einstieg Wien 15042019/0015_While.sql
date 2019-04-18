--WHILE

/*
code muss immer wieder ausgeführt
-->Schleife

while 
	begin

	end


*/

while 1=1
	begin 
	   select 'A'
	end



while (select count(*) from customers) < 100
	begin
		select 'XY'
	end


--häufigste Form einer Schleife


declare  @i as int	= 1

while @i < 10
	begin
	   select @i 
	   set @i = @i +1 	  --Alternativ set @i+=1
	end


 --auch break und continue möglich
 --break veranlasst den sofortigen Schleifenabbruch
 --continue springt sofort zum Schleifeneinstieg



declare  @i as int	= 1

while @i < 10
	begin
	   select @i 
	   if @i = 4 continue  --endlosschleife ..springt zum Einstieg zurück
	   if @i = 5  break	   --sofort raus...
	   set @i = @i +1 	  --Alternativ set @i+=1
	end


--TX
--erhöhe die Frachtkosten solange bis der Schnitt 100 erreicht hat
--aber nicht mehr...
--+10%
set 	Nocount on

select avg(freight) from orders
begin tran
while (select avg(freight) from orders)*1.1 < 100	
	begin
		update orders set freight*=1.1
	end
select avg(freight) from orders
print 'MIST!!!!!! verdammter..zuviel erhöht!'
rollback 
update... /1.1




