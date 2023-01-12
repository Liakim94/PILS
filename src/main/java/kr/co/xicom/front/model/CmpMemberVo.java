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
//
//    public String getBizNo() {
//        return bizNo;
//    }
//
//    public void setBizNo(String bizNo) {
//        this.bizNo = bizNo;
//    }
//
//    public String getBizNo1() {
//        return bizNo1;
//    }
//
//    public void setBizNo1(String bizNo1) {
//        this.bizNo1 = bizNo1;
//    }
//
//    public String getBizNo2() {
//        return bizNo2;
//    }
//
//    public void setBizNo2(String bizNo2) {
//        this.bizNo2 = bizNo2;
//    }
//
//    public String getBizNo3() {
//        return bizNo3;
//    }
//
//    public void setBizNo3(String bizNo3) {
//        this.bizNo3 = bizNo3;
//    }
//
//
//    public String getMem_cd() {
//        return mem_cd;
//    }
//
//    public void setMem_cd(String mem_cd) {
//        this.mem_cd = mem_cd;
//    }
//
//    public String getCmpNm() {
//        return cmpNm;
//    }
//
//    public void setCmpNm(String cmpNm) {
//        this.cmpNm = cmpNm;
//    }
//
//    public String getFdate() {
//        return fdate;
//    }
//
//    public void setFdate(String fdate) {
//        this.fdate = fdate;
//    }
//
//    public String getCeo() {
//        return ceo;
//    }
//
//    public void setCeo(String ceo) {
//        this.ceo = ceo;
//    }
//
//    public String getAddress() {
//        return address;
//    }
//
//    public void setAddress(String address) {
//        this.address = address;
//    }
//
//    public String getAddress_dtl() {
//        return address_dtl;
//    }
//
//    public void setAddress_dtl(String address_dtl) {
//        this.address_dtl = address_dtl;
//    }
//
//    public String getTelNo() {
//        return telNo;
//    }
//
//    public void setTelNo(String telNo) {
//        this.telNo = telNo;
//    }
//
//    public String getFaxNo() {
//        return faxNo;
//    }
//
//    public void setFaxNo(String faxNo) {
//        this.faxNo = faxNo;
//    }
//
//    public String getBizType() {
//        return bizType;
//    }
//
//    public void setBizType(String bizType) {
//        this.bizType = bizType;
//    }
//
//    public int getCapital() {
//        return capital;
//    }
//
//    public void setCapital(int capital) {
//        this.capital = capital;
//    }
//
//    public String getProduct() {
//        return product;
//    }
//
//    public void setProduct(String product) {
//        this.product = product;
//    }
//    public String getConQ() {
//        return conQ;
//    }
//
//    public void setConQ(String conQ) {
//        this.conQ = conQ;
//    }
//
//    public String getDeal_type() {
//        return deal_type;
//    }
//
//    public void setDeal_type(String deal_type) {
//        this.deal_type = deal_type;
//    }
//
//    public String getDeal_scale() {
//        return deal_scale;
//    }
//
//    public void setDeal_scale(String deal_scale) {
//        this.deal_scale = deal_scale;
//    }
//
//    public String getMaterial() {
//        return material;
//    }
//
//    public void setMaterial(String material) {
//        this.material = material;
//    }
//
//    public String getAppdate() {
//        return appdate;
//    }
//
//    public void setAppdate(String appdate) {
//        this.appdate = appdate;
//    }
//
//    public String getUpdate() {
//        return update;
//    }
//
//    public void setUpdate(String update) {
//        this.update = update;
//    }
//
//    public String getId() {
//        return id;
//    }
//
//    public void setId(String id) {
//        this.id = id;
//    }
//
//    public String getPasswd() {
//        return passwd;
//    }
//
//    public void setPasswd(String passwd) {
//        this.passwd = passwd;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getDeptNm() {
//        return deptNm;
//    }
//
//    public void setDeptNm(String deptNm) {
//        this.deptNm = deptNm;
//    }
//
//    public String getPosition() {
//        return position;
//    }
//
//    public void setPosition(String position) {
//        this.position = position;
//    }
//
//    public String getMbphno() {
//        return mbphno;
//    }
//
//    public void setMbphno(String mbphno) {
//        this.mbphno = mbphno;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public String getEmail1() {
//        return email1;
//    }
//
//    public void setEmail1(String email1) {
//        this.email1 = email1;
//    }
//
//    public String getEmail2() {
//        return email2;
//    }
//
//    public void setEmail2(String email2) {
//        this.email2 = email2;
//    }
//
//
//    public String getMemTelNo() {
//        return memTelNo;
//    }
//
//    public void setMemTelNo(String memTelNo) {
//        this.memTelNo = memTelNo;
//    }
//
//    public String getMemFaxNo() {
//        return memFaxNo;
//    }
//
//    public void setMemFaxNo(String memFaxNo) {
//        this.memFaxNo = memFaxNo;
//    }
//
//    public String getJoin_confm() {
//        return join_confm;
//    }
//
//    public void setJoin_confm(String join_confm) {
//        this.join_confm = join_confm;
//    }
//
//    public String getJoin_dt() {
//        return join_dt;
//    }
//
//    public void setJoin_dt(String join_dt) {
//        this.join_dt = join_dt;
//    }
//
//    public String getUpdate_mem() {
//        return update_mem;
//    }
//
//    public void setUpdate_mem(String update_mem) {
//        this.update_mem = update_mem;
//    }
//
//    public String getDelete_yn() {
//        return delete_yn;
//    }
//
//    public void setDelete_yn(String delete_yn) {
//        this.delete_yn = delete_yn;
//    }
//
//    public String getAuth_cd() {
//        return auth_cd;
//    }
//
//    public void setAuth_cd(String auth_cd) {
//        this.auth_cd = auth_cd;
//    }
//
//    public String getManagement_cd() {
//        return management_cd;
//    }
//
//    public void setManagement_cd(String management_cd) {
//        this.management_cd = management_cd;
//    }
}
