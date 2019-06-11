select * from LESSON_LEARNT where FREETEXT(solution_descr, 'detached printer')
select * from sys.fulltext_catalogs
select * from sys.fulltext_stopwords

select SERVERPROPERTY('isFullTextInstalled')
select * from DOCUMENTS
--delete from DOCUMENTS
SELECT * FROM freetexttable(dbo.LESSON_LEARNT, (problem_descr, solution_descr), 'test', 5) as T
	join dbo.LESSON_LEARNT as LL on T.[KEY] = LL.ll_ref_no


select * from sys.syslanguages

insert into DOCUMENTS(title, content)
select 'Overtime Authorization Guide.txt', bulkcolumn
from openrowset(bulk 'C:\Projects\0\tricera-bot\Documents\Overtime Authorization Guide.txt', single_clob) as t

insert into DOCUMENTS(title, content)
select 'WS-QMS-FR-022 Overtime Authorization Form (OTA) v3.htm', bulkcolumn
from openrowset(bulk 'C:\Projects\0\tricera-bot\Documents\WS-QMS-FR-022 Overtime Authorization Form (OTA) v3.htm', single_clob) as t

