ALTER TABLE pis.tb_pils_cmp_agre ADD ratio varchar(4000) NULL;
COMMENT ON COLUMN pis.tb_pils_cmp_agre.ratio IS '반영비율';

ALTER TABLE pis.tb_banner_qust_answr ADD email_addr varchar(100) NULL;
COMMENT ON COLUMN pis.tb_banner_qust_answr.email_addr IS '이메일';

insert into tb_bbs_data(bbs_id,bbs_nm) values (8,'원재료 사이트');

ALTER TABLE pis.tb_bbs_info ADD site_url varchar(255) NULL;
COMMENT ON COLUMN pis.tb_bbs_info.site_url IS '사이트URL';
ALTER TABLE pis.tb_bbs_info ADD chk_info varchar(1000) NULL;
COMMENT ON COLUMN pis.tb_bbs_info.chk_info IS '확인 가능 정보';
ALTER TABLE pis.tb_bbs_info ADD features varchar(1000) NULL;
COMMENT ON COLUMN pis.tb_bbs_info.features IS '주요 특징';
ALTER TABLE pis.tb_bbs_info ADD chrg varchar(10) NULL;
COMMENT ON COLUMN pis.tb_bbs_info.chrg IS '유무료여부';

---------------------------------
CREATE TABLE pis.tb_pils_banner (
                                    ban_sn bigserial NOT NULL,
                                    ban_nm varchar(255) NULL,
                                    site_url varchar(255) NULL,
                                    stts int8 NULL,
                                    pc_img_path varchar(1000) NULL,
                                    sort_seq int8 NULL,
                                    regist_dt timestamp NULL,
                                    up_dt timestamp NULL,
                                    file_nm varchar(512) NULL,
                                    file_size int4 NULL,
                                    file_ty varchar(128) NULL,
                                    mobile_img_path varchar(1000) NULL,
                                    saved_path varchar(512) NULL,
                                    CONSTRAINT tb_pils_banner_pk PRIMARY KEY (ban_sn)
);

-- Column comments

COMMENT ON COLUMN pis.tb_pils_banner.ban_sn IS '배너연번';
COMMENT ON COLUMN pis.tb_pils_banner.ban_nm IS '배너명';
COMMENT ON COLUMN pis.tb_pils_banner.site_url IS '이미지링크';
COMMENT ON COLUMN pis.tb_pils_banner.stts IS '상태값';
COMMENT ON COLUMN pis.tb_pils_banner.pc_img_path IS 'pc배너';
COMMENT ON COLUMN pis.tb_pils_banner.sort_seq IS '정렬순서';
COMMENT ON COLUMN pis.tb_pils_banner.regist_dt IS '작성일자';
COMMENT ON COLUMN pis.tb_pils_banner.up_dt IS '수정일자';
COMMENT ON COLUMN pis.tb_pils_banner.file_nm IS '파일명';

CREATE TABLE pis.tb_pils_qna_contact (
                                         seq bigserial NOT NULL,
                                         sort_seq int4 NULL,
                                         inst_nm varchar(100) NULL,
                                         contact varchar(100) NULL,
                                         up_dt timestamp NULL,
                                         CONSTRAINT tb_pils_qna_contact_pk PRIMARY KEY (seq)
);

-- Column comments

COMMENT ON COLUMN pis.tb_pils_qna_contact.seq IS 'pk';
COMMENT ON COLUMN pis.tb_pils_qna_contact.sort_seq IS '정렬순서';
COMMENT ON COLUMN pis.tb_pils_qna_contact.inst_nm IS '기관명';
COMMENT ON COLUMN pis.tb_pils_qna_contact.contact IS '연락처';
COMMENT ON COLUMN pis.tb_pils_qna_contact.up_dt IS '수정일자';

-------------------

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
