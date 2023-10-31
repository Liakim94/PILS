

insert into tb_cd_data (cd_grp, cd, cd_nm) values ('M100','M103','신청회원');
ALTER TABLE pis.tb_pils_mbr ADD cmp_nm varchar(100) NULL;
COMMENT ON COLUMN pis.tb_pils_mbr.cmp_nm IS '기업명';
ALTER TABLE pis.tb_pils_cmp_agre ADD type_cd varchar(36) NULL;
COMMENT ON COLUMN pis.tb_pils_cmp_agre.type_cd IS '구분코드';

CREATE TABLE pis.tb_pils_perf (
                                  SEQ bigserial not null,
                                  cmp_nm varchar(100) NULL,
                                  cntr_pd varchar(100) NULL,
                                  cntr_numb int8 NULL,
                                  cmp_numb int8 NULL,
                                  intrlck varchar(1000) NULL,
                                  "change" varchar(1000) NULL,
                                  intrlck_perf varchar(1000) NULL,
                                  etc varchar(1000) NULL,
                                  regist_dt timestamp null,
                                  user_id varchar(100) not NULL,
                                  intrlck_file_nm varchar(255) NULL,
                                  change_file_nm varchar(255) NULL,
                                  intrlck_perf_file_nm varchar(255) NULL,
                                  etc_file_nm varchar(255) NULL,
                                  CONSTRAINT tb_pils_perf_pk PRIMARY KEY (seq)
);

-- Column comments

COMMENT ON COLUMN pis.tb_pils_perf.cmp_nm IS '기업명';
COMMENT ON COLUMN pis.tb_pils_perf.cntr_pd IS '계약기간';
COMMENT ON COLUMN pis.tb_pils_perf.cntr_numb IS '계약건수';
COMMENT ON COLUMN pis.tb_pils_perf.cmp_numb IS '약정체결 기업수';
COMMENT ON COLUMN pis.tb_pils_perf.intrlck IS '연동표';
COMMENT ON COLUMN pis.tb_pils_perf."change" IS '변동표';
COMMENT ON COLUMN pis.tb_pils_perf.intrlck_perf IS '연동실적';
COMMENT ON COLUMN pis.tb_pils_perf.etc IS '기타';
COMMENT ON COLUMN pis.tb_pils_perf.regist_dt IS '작성일자';

----------추가 (10.30)
ALTER TABLE pis.tb_pils_cmp_agre DROP CONSTRAINT tb_pils_cmp_agre_pk;
ALTER TABLE pis.tb_pils_cmp_agre ADD seq bigserial NOT NULL;
ALTER TABLE pis.tb_pils_cmp_agre ADD CONSTRAINT tb_pils_cmp_agre_pk PRIMARY KEY (seq);
ALTER TABLE pis.tb_pils_cmp_agre ADD ex_nm varchar(100) NULL;
ALTER TABLE pis.tb_pils_cmp_agre ADD regist_dt timestamp NULL;
COMMENT ON COLUMN pis.tb_pils_cmp_agre.ex_nm IS '작성예시명';
COMMENT ON COLUMN pis.tb_pils_cmp_agre.type_cd IS '구분코드(관리자:M101,회원:M102)';
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN ratio TYPE varchar(100) USING ratio::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN etc TYPE varchar(500) USING etc::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN formula TYPE varchar(500) USING formula::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN reflect_point TYPE varchar(100) USING reflect_point::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN rqrm_date TYPE varchar(100) USING rqrm_date::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN rqrm_cycl TYPE varchar(100) USING rqrm_cycl::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN rqrm_ust TYPE varchar(100) USING rqrm_ust::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN change_point TYPE varchar(100) USING change_point::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN std_point TYPE varchar(100) USING std_point::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN prmy_mat_std TYPE varchar(500) USING prmy_mat_std::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN prmy_mat TYPE varchar(500) USING prmy_mat::varchar;
ALTER TABLE pis.tb_pils_cmp_agre ALTER COLUMN name TYPE varchar(500) USING name::varchar;
