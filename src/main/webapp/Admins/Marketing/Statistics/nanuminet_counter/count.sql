if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[static_table]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[static_table] 

CREATE TABLE static_table 
(
	s_idx int IDENTITY (1, 1) NOT NULL PRIMARY KEY  ,
	s_year int  DEFAULT year(getdate()) ,
	s_month tinyint DEFAULT month(getdate()) ,
	s_day  tinyint  DEFAULT day(getdate()) ,
	s_week tinyint DEFAULT datepart(w,getdate()) ,
	s_time tinyint   DEFAULT datepart(hh,getdate()) ,
	s_count int DEFAULT 1 ,
	s_fulldate smalldatetime DEFAULT getdate() 
) 
