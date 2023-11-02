
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

CREATE TABLE pis.tb_pils_cmp_const (
                                       seq bigserial NOT NULL,
                                       const_ty1 varchar(60) NULL,
                                       const_ty2 varchar(60) NULL,
                                       cmp_nm varchar(100) NULL,
                                       ceo varchar(30) NULL,
                                       bizno varchar(50) NOT NULL,
                                       regist_num varchar(50) NULL,
                                       addr varchar(100) NULL,
                                       addr_dtl varchar(100) NULL,
                                       biz_ty varchar(30) NULL,
                                       product varchar(100) NULL,
                                       prmy_mat varchar(100) NULL,
                                       mem_nm varchar(30) NULL,
                                       "position" varchar(30) NULL,
                                       mbphno varchar(15) NULL,
                                       email varchar(64) NULL,
                                       pswd varchar(100) NULL,
                                       regist_dt timestamp NULL,
                                       filenm1 varchar(255) NULL,
                                       filenm2 varchar(255) NULL,
                                       filenm3 varchar(255) NULL,
                                       filenm4 varchar(255) NULL,
                                       filenm1_path varchar(1000) NULL,
                                       filenm2_path varchar(1000) NULL,
                                       filenm3_path varchar(1000) NULL,
                                       filenm4_path varchar(1000) NULL,
                                       CONSTRAINT tb_pils_cmp_const_pk PRIMARY KEY (seq)
);

-- Column comments

COMMENT ON COLUMN pis.tb_pils_cmp_const.seq IS 'pk';
COMMENT ON COLUMN pis.tb_pils_cmp_const.const_ty1 IS '확인서발급';
COMMENT ON COLUMN pis.tb_pils_cmp_const.const_ty2 IS '약정컨설팅';
COMMENT ON COLUMN pis.tb_pils_cmp_const.cmp_nm IS '기업명';
COMMENT ON COLUMN pis.tb_pils_cmp_const.ceo IS '대표자명';
COMMENT ON COLUMN pis.tb_pils_cmp_const.bizno IS '사업자번호';
COMMENT ON COLUMN pis.tb_pils_cmp_const.regist_num IS '법인등록번호';
COMMENT ON COLUMN pis.tb_pils_cmp_const.addr IS '주소';
COMMENT ON COLUMN pis.tb_pils_cmp_const.addr_dtl IS '상세주소';
COMMENT ON COLUMN pis.tb_pils_cmp_const.biz_ty IS '위탁/수탁 대상 여부';
COMMENT ON COLUMN pis.tb_pils_cmp_const.product IS '거래 대상 물품명';
COMMENT ON COLUMN pis.tb_pils_cmp_const.prmy_mat IS '주요 원재료 후보';
COMMENT ON COLUMN pis.tb_pils_cmp_const.mem_nm IS '담당자명';
COMMENT ON COLUMN pis.tb_pils_cmp_const.pstn IS '직위';
COMMENT ON COLUMN pis.tb_pils_cmp_const.mbphno IS '담당자 연락처';
COMMENT ON COLUMN pis.tb_pils_cmp_const.email IS '담당자 메일주소';
COMMENT ON COLUMN pis.tb_pils_cmp_const.pswd IS '비번';
COMMENT ON COLUMN pis.tb_pils_cmp_const.regist_dt IS '등록일자';
COMMENT ON COLUMN pis.tb_pils_cmp_const.filenm1 IS '사업신청서&활용계획서';
COMMENT ON COLUMN pis.tb_pils_cmp_const.filenm2 IS '사업자등록증&중소기업확인서';
COMMENT ON COLUMN pis.tb_pils_cmp_const.filenm3 IS '개인 또는 법인(신용)정보 수집·이용·제공 조회 동의서';
COMMENT ON COLUMN pis.tb_pils_cmp_const.filenm4 IS '국세&지방세 완납증명서';

