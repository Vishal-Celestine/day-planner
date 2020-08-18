drop table timetable;
create table timetable (id NUMBER not null, planStarttime date, planEndtime date,
remtext varchar(50) , completed varchar(1) default 'N', PRIMARY KEY (ID));

CREATE SEQUENCE auto_increment_tb_seq;

CREATE OR REPLACE TRIGGER auto_incr_tt_insert
 BEFORE INSERT ON timetable
 FOR EACH ROW
BEGIN
 SELECT auto_increment_tb_seq.nextval
 INTO :new.id
 FROM dual;
END;