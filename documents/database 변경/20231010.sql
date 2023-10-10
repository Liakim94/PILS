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
