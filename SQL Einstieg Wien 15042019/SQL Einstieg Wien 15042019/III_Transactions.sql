--Transaktionen

--M�glichkeit �nderungen in der DB r�ckg�ngig zu machen

begin tran

--�nderungen: INS, UP, DEL
--Achtung alle ge�nderten Daten stehen anderen Verbindungen
--per default nicht zur Verf�gung ... Warten!!

--Transaktionen m�ssen abgeschlossen werden
commit -- �nderung �st fix
rollback -- alle �nderungen sind r�ckg�ngig gemacht worden

--Grunds�tzlich kann ein Lesen das schreiben hindern
--und ein Schreiben das Lesen
--aber das ist eine andere Geschichte.. ;-)

--> siehe set transaction isolation level readcommit   zb
