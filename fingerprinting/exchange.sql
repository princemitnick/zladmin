create database exchange;
create table temp as select * from emrid;

--- Verifier nouveau ....

 select t.emr_id, t.url from temp t where t.emr_id not in (select emr_id from emrid);

select count(t.emr_id), t.url from temp t where t.emr_id not in (select emr_id from emrid) group by t.url;

select t.emr_id, t.url from temp t inner join emrid e on e.emr_id = t.emr_id;

insert into emrid select * from temp t where t.emr_id not in (select emr_id from emrid) ;



select hivemr,lastname,firstname from person where hivemr is not null;
