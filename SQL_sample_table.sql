create table sample_table( ID int, Name varchar(50), Age int);

select * from sample_table;

alter table sample_table
add DepartmentID varchar(50);

alter table sample_table
alter column DepartmentID int;

alter table sample_table
drop column DepartmentID;

insert into sample_table (ID, Name, Age) values (01,'Vikkey',29);
insert into sample_table (ID, Name, Age) values (02,'Rashmi',30);

update sample_table set Age=29 where ID=2;

delete from sample_table where ID=2;