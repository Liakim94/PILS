ALTER TABLE pis.tb_pils_cmpmbr ALTER COLUMN ceo TYPE varchar(30) USING ceo::varchar;
ALTER TABLE pis.tb_pils_cmpmbr ADD cmp_scale varchar(10) NULL;
ALTER TABLE pis.tb_pils_cmpmbr ALTER COLUMN biz_ty TYPE varchar(60) USING biz_ty::varchar;
COMMENT ON COLUMN pis.tb_pils_cmpmbr.cmp_scale IS '기업규모';
COMMENT ON COLUMN pis.tb_pils_cmpmbr.joincmp IS '참여기업 수(수탁기업수)';
ALTER TABLE pis.tb_pils_cmpmbr ADD biz_tycd varchar(30) NULL;
COMMENT ON COLUMN pis.tb_pils_cmpmbr.biz_tycd IS '업종구분';
ALTER TABLE pis.tb_pils_cmpmbr ALTER COLUMN appdt TYPE date USING appdt::date;
COMMENT ON COLUMN pis.tb_pils_cmpmbr.appdt IS '참여일자';
