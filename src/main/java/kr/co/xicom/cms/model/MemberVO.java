package kr.co.xicom.cms.model;

import kr.co.xicom.cmmn.model.DefaultVO;

/**
 * @Class Name : MemberVO.java
 * @Description : MemberVO Class
 * @Modification Information
 * @
 * @  수정일	 수정자		 수정내용
 * @ ---------	---------	-------------------------------
 * @ 2017.09.11  백상진      최초생성
 *
 *  Copyright (C) by XICOM All right reserved.
 */
public class MemberVO extends DefaultVO{
	/*
	 * 
	  	1;사용중
		4:탈퇴
		9:사용중지
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int memSeq				= 0; 	// 회원SEQ
	private String memId			= "";	// 아이디
	private String memNm			= "";	// 회원명
	private String memPwd			= "";	// 비밀번호
	private String joinTyp			= "";	// 가입유형
	private String tel			 	= "";	// 전화번호
	private String email			= "";	// 이메일
	private String gend			 	= "";	// 성별
	private String brth			 	= "";	// 생년월일
	private String zip				= "";	// 우편번호
	private String addr1			= "";	// 주소1
	private String addr2			= "";	// 주소2
	private String steId			= "";	// 사이트아이디
	private String cp				= "";	// 휴대전화번호
	private String joinDe			= "";	// 가입일시
	private String pwdUpdDe			= "";	// 비밀번호수정일시
	private String ci				= "";	// CI
	private String di				= "";	// DI
	
	private String chkNo[]			= null;
	
	private int grpSeq				= 0; // 회원등급 SEQ
	private String grpNm			= ""; // 회원등급
	
	private String lastAcc			= "";
	
	
	public String getJoinTyp() {
		return joinTyp;
	}
	public void setJoinTyp(String joinTyp) {
		this.joinTyp = joinTyp;
	}
	public int getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(int memSeq) {
		this.memSeq = memSeq;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getMemPwd() {
		return memPwd;
	}
	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGend() {
		return gend;
	}
	public void setGend(String gend) {
		this.gend = gend;
	}
	public String getBrth() {
		return brth;
	}
	public void setBrth(String brth) {
		this.brth = brth;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getSteId() {
		return steId;
	}
	public void setSteId(String steId) {
		this.steId = steId;
	}
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = cp;
	}
	public String getJoinDe() {
		return joinDe;
	}
	public void setJoinDe(String joinDe) {
		this.joinDe = joinDe;
	}
	public String getPwdUpdDe() {
		return pwdUpdDe;
	}
	public void setPwdUpdDe(String pwdUpdDe) {
		this.pwdUpdDe = pwdUpdDe;
	}
	public String getCi() {
		return ci;
	}
	public void setCi(String ci) {
		this.ci = ci;
	}
	public String getDi() {
		return di;
	}
	public void setDi(String di) {
		this.di = di;
	}
	public int getGrpSeq() {
		return grpSeq;
	}
	public void setGrpSeq(int grpSeq) {
		this.grpSeq = grpSeq;
	}
	public String getGrpNm() {
		return grpNm;
	}
	public void setGrpNm(String grpNm) {
		this.grpNm = grpNm;
	}
	public String[] getChkNo() {
		String[] arrList = null;
		if(chkNo != null){
			arrList = new String[chkNo.length];
			for(int i = 0; i < chkNo.length; i++)
			{arrList[i] = this.chkNo[i];}
		}
		return arrList;
	}
	public void setChkNo(String[] chkNo) {
		this.chkNo = new String[chkNo.length];
		for(int i=0; i < chkNo.length; i++){
			this.chkNo[i] = chkNo[i];
		}
	}
	public String getLastAcc() {
		return lastAcc;
	}
	public void setLastAcc(String lastAcc) {
		this.lastAcc = lastAcc;
	}
	
	

}
