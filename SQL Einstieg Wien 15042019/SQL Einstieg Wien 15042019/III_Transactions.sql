--Transaktionen

--Möglichkeit Änderungen in der DB rückgängig zu machen

begin tran

--Änderungen: INS, UP, DEL
--Achtung alle geänderten Daten stehen anderen Verbindungen
--per default nicht zur Verfügung ... Warten!!

--Transaktionen müssen abgeschlossen werden
commit -- Änderung íst fix
rollback -- alle Änderungen sind rückgängig gemacht worden

--Grundsätzlich kann ein Lesen das schreiben hindern
--und ein Schreiben das Lesen
--aber das ist eine andere Geschichte.. ;-)

--> siehe set transaction isolation level readcommit   zb
