package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RcmdVO extends DefaultVO{
    private int rcmd_no = 0;  //pk
    private String status = "";  //공개여부
    private String apply_cmpNm = "";  //신청기업_기업명
    private String apply_bizno = "";
    private String app_bizNo1 = "";
    private String app_bizNo2 = "";
    private String app_bizNo3 = "";
    private String apply_ceo = "";  //신청기업_대표자명
    private String apply_telNo = "";
    private String apply_email = "";  //신청기업_메일
    private String apply_email1="";
    private String apply_email2="";
    private String rcmd_cmpNm = "";  //추천기업_기업명
    private String rcmd_bizno = "";
    private String rcmd_bizNo1 = "";
    private String rcmd_bizNo2 = "";
    private String rcmd_bizNo3 = "";
    private String rcmd_telNo = "";  //추천기업_대표번호
    private String rcmd_email = "";  //추천기업_메일
    private String rcmd_email1="";
    private String rcmd_email2="";
    private String rcmd_detail = "";  //추천사유
    private String appdt = "";  //신청일자


}
