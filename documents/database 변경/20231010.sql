ALTER TABLE pis.tb_pils_cmp_agre ADD ratio varchar(4000) NULL;
COMMENT ON COLUMN pis.tb_pils_cmp_agre.ratio IS '반영비율';

ALTER TABLE pis.tb_banner_qust_answr ADD email_addr varchar(100) NULL;
COMMENT ON COLUMN pis.tb_banner_qust_answr.email_addr IS '이메일';
