 --IF

 /* wenn dann*/

 if Bedingung Code else Code

 if 1=1 select 'A'
 if 1=0 select 'A'
 if 1=0 select 'A' else select 'B'

 --aber hier ?
 --nur B ?? Code sollte aber gesamt ausgeführt werden
 if 1=0
 select 'A'
 select 'B'


 if 1=0
	begin
	   select 'A'
	   select 'B'
	end
else
	Begin
	   select 'C'
	   select 'D'
	end


--TX.. erhöhe die Frachtkosten um 10% wenn der schnitt unter 100 liegt
--sonst senken um 10%
--im IF Kontrolle
--aber TX rollback


declare @frschnitt as money = (Select avg(freight) from orders)
select 'vorher: '+ convert(varchar(50),@frschnitt)
begin tran
	if @frschnitt > 100
			begin
				update orders set freight = freight /1.1
			end
	else 
			begin
				 update orders set freight = freight *1.1
			end
select 'nachher: ' + convert(varchar(50), avg(freight)) from orders
rollback

