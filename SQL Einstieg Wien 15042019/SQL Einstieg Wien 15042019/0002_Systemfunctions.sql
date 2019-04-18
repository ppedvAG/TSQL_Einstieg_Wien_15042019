--SQL Server besitzt umfangreiche F()
--für Text, Datum, Mathe etc....

--Zahl
select 100

--Text
select 'text'

--Datum
select getdate() --heutige Datum auf ms genau

--Datum in 10 Tagen
select '15.04.2019' 

--zu einem Datum etwas dazurechnen
select dateadd(dd, 10, '15.04.2019')


--der Select für das getdate muss nicht wiederholt werden..
select dateadd(yy, 2, getdate())


--welches Datum hatten wir vor 2 Quartalen

select dateadd( qq,-2 , getdate())


--Datumsdifferenz
--auf die Reihenfolge achten
select datediff(dd,'10.4.2019', '15.04.2019') --5

--Vorsicht negative Zahlen
select datediff(dd,'15.4.2019', '10.04.2019') --   -5!!

--wieviele Stunden sind seit eurer Geburt vergangen
--seit Mondlandung

select datediff(dd, '20.7.1969', getdate()) --18166 Tage

--Ausgabe der Datumsbezeichnungen

select datename(dd, getdate()) --15 ??

select datename(mm, getdate())-- April !

select datename(dw, getdate()) --jetzt Montag


--Wir brauche nur einen Teil des Datums

select datepart(qq, Getdate()) --2
select datepart(dd, Getdate()) --2

--Abkz
select	   day(getdate())
		 , year(getdate())
		 , month(getdate())



--TEXT

select 'abcdef'

select 'A' + 'B' --AB

select 'A ' + ' B' --A  B..auch Leerzeichen

--left right

select left('abcdef',1) --a
select right('abcdef',1) --f

select 'abcdef    ' --viele Leerzeichen am Ende

select rtrim('abcdef   ') --??

--Test: Länge messen  len(), datalenght()

select len('abcdef   '), datalength('abcdef   ')
--datalenght misst die tats. Länge in der DB

select datalength(rtrim('abcdef   ')) --6 passt

--Leerzeichen im Text werden nie "weggetrimmt"
select datalength(rtrim(' abcdef   ')) --7

select reverse('Ein Neger mit Gazelle zagt im Regen nie')

select substring('abcdef',3,2) --cd

select stuff('abcdef',3,2,'XXX')

--01 675 82738723
--0049 8677 98890

--01 675 82738xxx
--0049 8677 98xxx

--'01 675 82738723'

select reverse(stuff(reverse('01 675 82738723'),1,3,'xxx'))

select stuff('01 675 82738723',len('01 675 82738723')-2,3,'XXX')

select left('01 675 82738723',len('01 675 82738723')-3) + 'xxx'


--Suche nach Maier
--Sucht nach "Klang"
select soundex('maier')

select soundex('meier')

select soundex('mayer')

select soundex('mayr')












		
		



















