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