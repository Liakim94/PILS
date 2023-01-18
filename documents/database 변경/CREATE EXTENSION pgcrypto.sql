CREATE EXTENSION pgcrypto;

--23-01-18 DO 추가--
ALTER TABLE pis.tb_atch RENAME COLUMN bigno TO bizno;
insert into tb_cd_data (cd_grp, cd, cd_nm) values ('M500','M501','주담당자');
insert into tb_cd_data (cd_grp, cd, cd_nm) values ('M500','M502','부담당자');
insert into tb_cd_data (cd_grp, cd, cd_nm) values ('M600','M601','기업로고');
insert into tb_cd_data (cd_grp, cd, cd_nm) values ('M600','M602','첨부서류');
update tb_bbs_data set bbs_nm ='자주 묻는 질문' where bbs_id=7;
insert into tb_bbs_data (bbs_id,bbs_nm) values(6,'기업들이 준비할 일');