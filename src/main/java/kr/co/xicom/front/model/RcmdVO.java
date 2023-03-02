package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RcmdVO {
    private String app_cmpNm = "";  //신청기업_기업명
    private String app_ceo = "";  //신청기업_대표자명
    private String app_address = "";  //신청기업_주소
    private String app_address_dtl = "";
    private String app_bizType = "";  //신청기업_업종
    private String app_telNo = "";
    private String app_mem_email = "";  //신청기업_담당자메일
    private String app_email1="";
    private String app_email2="";
    private String app_mem_telNo = "";  //신청기업_담당자전화
    private String rcmd_cmpNm = "";  //추천기업_기업명
    private String rcmd_ceo = "";  //추천기업_대표자명
    private String rcmd_address = "";  //추천기업_주소
    private String rcmd_address_dtl = "";
    private String rcmd_bizType = "";  //추천기업_업종
    private String rcmd_telNo = "";  //추천기업_대표번호
    private String rcmd_mem_email = "";  //추천기업_담당자메일
    private String rcmd_email1="";
    private String rcmd_email2="";
    private String rcmd_mem_telNo = "";  //추천기업_담당자전화
    private String rcmd_detail = "";  //추천사유
    private String appdt = "";  //신청일자
    
}
