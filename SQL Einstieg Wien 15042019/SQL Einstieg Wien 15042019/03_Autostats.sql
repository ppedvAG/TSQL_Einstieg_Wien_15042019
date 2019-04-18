--setup a table and insert 2 million rows
drop database testautostats
go
create database testautostats
go
use testautostats
go
create table t (c1 int)
go
set nocount on
declare @i int
set @i = 0
begin tran
while @i < 2000000
begin
declare @rand int = rand() * 1000000000
    if (@i % 100000 = 0)
    begin
        while @@trancount > 0     commit tran
        begin tran
    end
    insert into t values (@rand)
    set @i  = @i + 1
end
commit tran

go
create index ix on t (c1)
go

 

 

-- last_updated column
select count (*) from t join sys.objects o on t.c1=o.object_id
go
select * from sys.stats st cross apply sys.dm_db_stats_properties (object_id, stats_id) 
where st.object_id = object_id ('t')



 

--delete < 20% row
--last_updated column changed
delete top (499999) from t
go
select count (*) from t join sys.objects o on t.c1=o.object_id

go
select * from sys.stats st cross apply sys.dm_db_stats_properties (object_id, stats_id) 
where st.object_id = object_id ('t')

 



 select 1500001*0.2 --300000

--now switch DB compt level to 120
--<20%
alter database testautostats SET COMPATIBILITY_LEVEL=120
go
delete top (250000) from t
go
select * from sys.stats st cross apply sys.dm_db_stats_properties (object_id, stats_id) 
where st.object_id = object_id ('t')