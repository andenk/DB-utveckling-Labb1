drop table NewUsers
drop table SuccessfulMissions
select Spacecraft, [Launch date],
[Carrier rocket], Operator ,[Mission type]  into SuccessfulMissions from MoonMissions where Outcome = 'Successful' 

GO

update SuccessfulMissions

set Operator = TRIM(Operator)

GO


delete from [SuccessfulMissions] where [launch date]  > '2010'


GO


select Operator ,[Mission type], count(*) as [Mission count]  from SuccessfulMissions group by Operator ,[Mission type]  having count(*)>1 order by 1,2

GO


select id,username,Password, FirstName+' '+LastName as 'Name',Email,phone,case when (substring( id,10,1 )%2 = 0) then 'Female' else 'Male' end as Gender into NewUsers
 from Users

GO


select username,count(*) as duplicates from NewUsers group by username having count(*)>1




GO

update NewUsers
SET Username = lower(left(Name, 2) +substring(Name, CHARINDEX(' ', Name)+1,4))
where Username = 'felber' OR UserName = 'sigpet';

GO


delete from NewUsers where gender = 'Female' and left( id,2) < '70'

GO

insert into NewUsers (id,username,password,Name,email,phone,gender) 
values('970804-3322','AndNeh',NEWID(),'Andreas Nehl','@hotmail','007-0707','Male');

GO

select gender, avg(DATEDIFF (year , left (id,6 ) , getdate() )) as 'avarage age' from NewUsers group by gender



