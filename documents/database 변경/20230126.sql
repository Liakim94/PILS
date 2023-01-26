-- pis.tb_pils_cmp_atch_seq definition

-- DROP SEQUENCE pis.tb_pils_cmp_atch_seq;

CREATE SEQUENCE pis.tb_pils_cmp_atch_seq
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
	CACHE 1
	NO CYCLE;

-- pis.tb_pils_cmp_atch definition

-- Drop table

-- DROP TABLE pis.tb_pils_cmp_atch;

CREATE TABLE pis.tb_pils_cmp_atch (
                                      cmp_atch_seq int4 NOT NULL, -- 첨부파일인련번호
                                      file_name varchar(512) NULL, -- 파일명
                                      file_size int4 NULL, -- 파일 사이즈
                                      file_type varchar(128) NULL, -- 파일 mimetype
                                      saved_path varchar(512) NULL, -- 파일 저장 경로
                                      saved_file_name varchar(512) NULL, -- 파일 저장 명
                                      atch_type varchar(10) NOT NULL, -- 첨부유형, PROD: 주요생산품 이미지, PRMT: 홍보 이미지, ATTACH: 첨부파일
                                      biz_no varchar(10) NOT NULL, -- 사업자번호
                                      video_url varchar(512) NULL, -- 비디오 URL (사용 미정)
                                      regist_date timestamp NOT NULL, -- 등록일시
                                      CONSTRAINT tb_pils_cmp_atch_pk PRIMARY KEY (cmp_atch_seq)
);
COMMENT ON TABLE pis.tb_pils_cmp_atch IS '기업현황 첨부파일';

-- Column comments

COMMENT ON COLUMN pis.tb_pils_cmp_atch.cmp_atch_seq IS '첨부파일인련번호';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.file_name IS '파일명';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.file_size IS '파일 사이즈';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.file_type IS '파일 mimetype';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.saved_path IS '파일 저장 경로';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.saved_file_name IS '파일 저장 명';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.atch_type IS '첨부유형, PROD: 주요생산품 이미지, PRMT: 홍보 이미지, ATTACH: 첨부파일';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.biz_no IS '사업자번호';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.video_url IS '비디오 URL (사용 미정)';
COMMENT ON COLUMN pis.tb_pils_cmp_atch.regist_date IS '등록일시';