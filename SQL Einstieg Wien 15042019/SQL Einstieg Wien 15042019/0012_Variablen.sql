--Variablen

/*
Variablen haben immer ein 	@ am Namensanfang

lokale Variablen
@var
Gültigkeitsbereich: nur die eine Session, die sie erstellt
Gültigkeitsdauer:  nur während des Batches (--> GO)

globale Variablen
@@var
Gültigkeitsbereich: alle andere Sessions ebenso
Gültigkeitsdauer: nur während des Batches (--> GO)


*/

´--manuelle zuweisen
declare @var1 as int
set @var1 = 10

select @var1
select @var1*100

select * from products where unitprice < @var1

--dynamisches zuweisen per Select
--aber man darf nicht gleichzeitig zuweisen und ausgeben

declare @var2 as float
select @var2=avg(freight) from orders
select @var2
select @var2=avg(freight), avg(freight) from orders		  --Error
set @var2= 1000



--Suche alle Produkte , die Seafood sind
--man kann auch mehr Variablen in einem declare definieren
--und auch default Werte vorgeben

declare @Katname as varchar(50), @KatId as int	= 1

set @Katname = 'Seafood'

select @KatId = categoryId 
	from categories 
	where CategoryName=@Katname

select productname, unitprice 
		from products
		where 
		CategoryID=@KatId

