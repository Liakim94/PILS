package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

/**
 * 참여 회사 첨부파일 VO.
 */
@Getter
@Setter
@ToString
public class CompanyAttachVO {

    /** 첨부파일 일련번호 */
    private Integer cmpAtchSeq;

    /** 오리지널 파일 명 */
    private String fileName;

    /** 파일 사이즈 */
    private Integer fileSize;

    /** 파일 Mime-type */
    private String fileType;

    /** 파일 저장 경로 */
    private String savedPath;

    /** 파일 저장 명 */
    private String savedFileName;

    /** 첨부 유형
     *  PROD : 주요생상품 이미지
     *  PRMT : 홍보 이미지
     *  ATTACH : 첨부파일
     */
    private String atchType;

    /** 사업자 번호 */
    private String bizNo;

    /** 비디오 URL */
    private String videoUrl;

    /** 등록 일시 */
    private Timestamp registDate;

}
