	  --SELECT

/*
SELECT 
		Spalten, Spalten, ...	
		* -- alle Spaltendes FROM
		Mathe as ALIAS --ALias Vergabe
		'Text', Zahlen
		F() --
		(Select ...) -muss aber dann eine Spalte mit einer Zeile sein	
FROM
	 Tabelle1 t1
			inner|left|right join Tabelle2 t2 ON t1.sp = t2.sp
			inner|left|right join Tabelle3 t2 ON t3.sp = t2.sp
			...			
WHERE
	 SP > < >= <= != like in between Wert
	 --Wildcards nur bei like: 
				% -- für beliebig viele Zeichen (0 bis ...)
				_ -- steht für ein unbekanntes Zeichen
	-- [] Suchen nach Wertebereichen
	--Sonderfälle: % [%]
				   '  ''
ORDER BY
	ALIAS, 
	Spalten
	"nach Stelle"




*/

select 
		c.CustomerID, c.City,
		o.OrderID, o.orderdate ,
		o.freight
from customers c inner join orders o on c.CustomerID=o.CustomerID


--Liste  aller Produkte und deren Kategorienamen
						  
Select productname, Categoryname
from products p inner join Categories cat 
		on cat.CategoryID = p.CategoryID
order by 1,2

--und jetzt noch die orderid dazuklemmen
Select productname, Categoryname , orderid
from 
	products p inner join Categories cat 
										on 	cat.CategoryID = p.CategoryID
			   inner join [Order Details] od 
										on	od.ProductID   = p.ProductID



--Region, Angestellte, Firma, Seafood

--welcher Angestellte hat welche Produkte aus der Kat Seafood
--an welche Firma verkauft, 
--wobei der Angstellte das Gebiet Eastern vertritt

select 
			c.CompanyName
		  ,	e.LastName
		  , p.ProductName
		  , cat.CategoryName
		  , r.RegionDescription
		  , t.TerritoryDescription
from 
	customers c inner join orders o				  on o.CustomerID=c.CustomerID
				inner join [Order Details] od	  on od.orderid  = o.orderid
				inner join employees e			  on e.EmployeeID= o.employeeid
				inner join EmployeeTerritories et on et.EmployeeID=e.EmployeeID
				inner join Territories t		  on t.TerritoryID= et.TerritoryID
				inner join Region r				  on r.RegionID= t.RegionID
				inner join products p			  on p.ProductID= od.ProductID
				inner join Categories cat		  On cat.CategoryID= p.CategoryID
 where 
		r.RegionDescription = 'Eastern'
		AND
		cat.CategoryName    = 'Seafood'
order by 
		e.LastName,p.ProductName


--Left right
--welcher Kunde hat nix gekauft?


select * 
from
		customers c inner join orders o on c.CustomerID=o.CustomerID


--CROSS		 .. jede Zeile mit jeder Zeile verknüpfen
-			-- karthesische Produkt.. etwas vorsichtig einsetzten


select * from customers cross join orders















