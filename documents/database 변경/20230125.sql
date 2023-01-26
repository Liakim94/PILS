ALTER TABLE pis.tb_pils_cmpmbr ADD main_movie_url varchar(1000) NULL;
COMMENT ON COLUMN pis.tb_pils_cmpmbr.main_movie_url IS '메인 동영상 URL';
ALTER TABLE pis.tb_pils_cmpmbr ADD logo_img_path varchar(1000) NULL;
COMMENT ON COLUMN pis.tb_pils_cmpmbr.logo_img_path IS '로고 이미지 경로';
ALTER TABLE pis.tb_pils_cmpmbr ADD sub_movie_url varchar(1000) NULL;
COMMENT ON COLUMN pis.tb_pils_cmpmbr.sub_movie_url IS '기업홍보 동영상 URL';
