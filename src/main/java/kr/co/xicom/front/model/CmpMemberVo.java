package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CmpMemberVo extends DefaultVO {
    private String bizNo = "";
    private String bizNo1 = "";
    private String bizNo2 = "";
    private String bizNo3 = "";
    private String mem_cd = "";  //기업회원구분
    private String cmpNm = "";
    private String fdate = "";
    private String ceo = "";
    private String address = "";
    private String address_dtl = "";
    private String telNo = "";
    private String faxNo = "";
    private String bizType = "";
    private int capital = 0;
    private String product = "";
    private String conQ = "";
    private String deal_type = "";
    private String deal_scale = "";
    private String material = "";
    private String appdate = "";  //신청일자
    private String update = ""; //동행기업 수정일자
    private String id = "";
    private String passwd = "";
    private String name = "";
    private String deptNm = "";
    private String position = "";
    private String mbphno = "";
    private String email = "";
    private String email1 = "";
    private String email2 = "";
    private String memTelNo = "";
    private String memFaxNo = "";
    private String join_confm = ""; //가입승인여부
    private String join_dt = "";
    private String update_mem = "";
    private String delete_yn = ""; //삭제여부
    private String auth_cd = ""; //권한코드
    private String management_cd = ""; //담당자구분코드

}
