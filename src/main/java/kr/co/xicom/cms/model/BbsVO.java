package kr.co.xicom.cms.model;

import kr.co.xicom.cmmn.model.DefaultVO;

/**
 * @Class Name : BbsVO.java
 * @Description : BbsVO Class
 * @Modification Information
 * @
 * @  수정일	  수정자		      수정내용
 * @ ---------	---------	-------------------------------
 * @ 2018.04.11   백상진              최초생성
 *
 *  Copyright (C) by XICOM All right reserved.
 */
public class BbsVO extends DefaultVO{
	
	/** STAT 옵션
	 
	[TB_BBS	- STAT]	0:사용안함 1:사용 4:완전삭제 8:임시저장삭제 9:임시저장
	 
	 */
	
	private static final long serialVersionUID = 1L;

	private int 	bbsId					=  0;  // 게시판아이디
	private String 	steId					=  ""; // 사이트아이디 
	private String	bbsNm					= "";  // 게시판명
	private String	bbsTyp					= "";  // 게시판유형
	private String	bbsDesc					= "";  // 게시판설명
	private String	rpyAt					= "";  // 답글여부
	private String	rpyOpnAt				= "";  // 답글비공개
	private String	cmtAt					= "";  // 댓글여부
	private String	ctgrAt					= "";  // 카테고리사용여부
	private String	tagAt					= "";  // 태그사용여부
	private String	opnAt					= "";  // 공개비공개
	private String	snsAt					= "";  // sns사용여부
	private String	srchAt					= "";  // 통합검색사용여부
	
	private String	notiAt					= "";  // 공지표시
	private String	notiDtAt				= "";  // 공지기간유무
	private String	notiStrDt				= "";  // 공지시작일자
	private String	notiEndDt				= "";  // 공지종료일자
	
	private String	attchAt					= "";  // 첨부파일여부
	private int 	attchSz					=  0;  // 첨부파일크기
	private String	attchSzUnt				= "";  // 첨부파일크기단위
	private int 	attchCnt				=  0;  // 첨부파일갯수
	private String	attchBkl				= "";  // 첨부파일블랙리스트
	private String	attchWtl				= "";  // 첨부파일화이트리스트
	private String	attchOdp				= "";  // 첨부파일우선순위
	private String	attchExtAt				= "";  // 첨부파일확장자저장여부
	private String	attchPath				= "";  // 첨부파일위치
	
	private String	thumAt					= "";  // 썸네일생성여부
	private String	thumExt					= "";  // 썸네일파일확장자
	private String	thumStd					= "";  // 썸네일규격
	private String	thumPath				= "";  // 썸네일위치
	private String	thumCreAt				= "";  // 썸네일즉시생성여부
	private String	thumCreCyl				= "";  // 썸네일생성주기
	
	private String	trcAt					= "";  // 동영상트랜스코딩여부
	private String	movPath					= "";  // 동영상위치
	private int		movThumCnt				=  0;  // 동영상썸네일갯수
	private String	movExt					= "";  // 동영상확장자
	private String	movStd					= "";  // 동영상규격
	private String	movCreAt				= "";  // 동영상즉시생성여부
	private String	trcCreCyl				= "";  // 트랜스코딩생성여부
	
	private String	autoRegAt				= "";  // 자동등록방지 여부
	private String	cpiAt					= "";  // 개인정보수집여부
	private String	cpiTyp					= "";  // 개인정보유형
	private String	btm						= "";  // 금지어
	
	private String	chkNo[]					= null;	// 리스트 체크박스
	

	public String[] getChkNo() {
		String[] arrChkNo = null;
		if(chkNo != null){
			arrChkNo = new String[chkNo.length];
			for(int i = 0; i < chkNo.length; i++){arrChkNo[i] = this.chkNo[i];}
		}
		return arrChkNo;
	}
	public void setChkNo(String[] chkNo) {
		this.chkNo = new String[chkNo.length];
		for(int i = 0; i < chkNo.length; i++)
			this.chkNo[i] = chkNo[i];
	}

	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getSteId() {
		return steId;
	}
	public void setSteId(String steId) {
		this.steId = steId;
	}
	public String getBbsNm() {
		return bbsNm;
	}
	public void setBbsNm(String bbsNm) {
		this.bbsNm = bbsNm;
	}
	public String getBbsTyp() {
		return bbsTyp;
	}
	public void setBbsTyp(String bbsTyp) {
		this.bbsTyp = bbsTyp;
	}
	public String getBbsDesc() {
		return bbsDesc;
	}
	public void setBbsDesc(String bbsDesc) {
		this.bbsDesc = bbsDesc;
	}
	public String getRpyAt() {
		return rpyAt;
	}
	public void setRpyAt(String rpyAt) {
		this.rpyAt = rpyAt;
	}
	public String getRpyOpnAt() {
		return rpyOpnAt;
	}
	public void setRpyOpnAt(String rpyOpnAt) {
		this.rpyOpnAt = rpyOpnAt;
	}
	public String getCmtAt() {
		return cmtAt;
	}
	public void setCmtAt(String cmtAt) {
		this.cmtAt = cmtAt;
	}
	public String getCtgrAt() {
		return ctgrAt;
	}
	public void setCtgrAt(String ctgrAt) {
		this.ctgrAt = ctgrAt;
	}
	public String getTagAt() {
		return tagAt;
	}
	public void setTagAt(String tagAt) {
		this.tagAt = tagAt;
	}
	public String getOpnAt() {
		return opnAt;
	}
	public void setOpnAt(String opnAt) {
		this.opnAt = opnAt;
	}
	public String getSnsAt() {
		return snsAt;
	}
	public void setSnsAt(String snsAt) {
		this.snsAt = snsAt;
	}
	public String getSrchAt() {
		return srchAt;
	}
	public void setSrchAt(String srchAt) {
		this.srchAt = srchAt;
	}
	public String getNotiAt() {
		return notiAt;
	}
	public void setNotiAt(String notiAt) {
		this.notiAt = notiAt;
	}
	public String getNotiDtAt() {
		return notiDtAt;
	}
	public void setNotiDtAt(String notiDtAt) {
		this.notiDtAt = notiDtAt;
	}
	public String getNotiStrDt() {
		return notiStrDt;
	}
	public void setNotiStrDt(String notiStrDt) {
		this.notiStrDt = notiStrDt;
	}
	public String getNotiEndDt() {
		return notiEndDt;
	}
	public void setNotiEndDt(String notiEndDt) {
		this.notiEndDt = notiEndDt;
	}
	public String getAttchAt() {
		return attchAt;
	}
	public void setAttchAt(String attchAt) {
		this.attchAt = attchAt;
	}
	public int getAttchSz() {
		return attchSz;
	}
	public void setAttchSz(int attchSz) {
		this.attchSz = attchSz;
	}
	public String getAttchSzUnt() {
		return attchSzUnt;
	}
	public void setAttchSzUnt(String attchSzUnt) {
		this.attchSzUnt = attchSzUnt;
	}
	public int getAttchCnt() {
		return attchCnt;
	}
	public void setAttchCnt(int attchCnt) {
		this.attchCnt = attchCnt;
	}
	public String getAttchBkl() {
		return attchBkl;
	}
	public void setAttchBkl(String attchBkl) {
		this.attchBkl = attchBkl;
	}
	public String getAttchWtl() {
		return attchWtl;
	}
	public void setAttchWtl(String attchWtl) {
		this.attchWtl = attchWtl;
	}
	public String getAttchOdp() {
		return attchOdp;
	}
	public void setAttchOdp(String attchOdp) {
		this.attchOdp = attchOdp;
	}
	public String getAttchExtAt() {
		return attchExtAt;
	}
	public void setAttchExtAt(String attchExtAt) {
		this.attchExtAt = attchExtAt;
	}
	public String getAttchPath() {
		return attchPath;
	}
	public void setAttchPath(String attchPath) {
		this.attchPath = attchPath;
	}
	public String getThumAt() {
		return thumAt;
	}
	public void setThumAt(String thumAt) {
		this.thumAt = thumAt;
	}
	public String getThumExt() {
		return thumExt;
	}
	public void setThumExt(String thumExt) {
		this.thumExt = thumExt;
	}
	public String getThumStd() {
		return thumStd;
	}
	public void setThumStd(String thumStd) {
		this.thumStd = thumStd;
	}
	public String getThumPath() {
		return thumPath;
	}
	public void setThumPath(String thumPath) {
		this.thumPath = thumPath;
	}
	public String getThumCreAt() {
		return thumCreAt;
	}
	public void setThumCreAt(String thumCreAt) {
		this.thumCreAt = thumCreAt;
	}
	public String getThumCreCyl() {
		return thumCreCyl;
	}
	public void setThumCreCyl(String thumCreCyl) {
		this.thumCreCyl = thumCreCyl;
	}
	public String getTrcAt() {
		return trcAt;
	}
	public void setTrcAt(String trcAt) {
		this.trcAt = trcAt;
	}
	public String getMovPath() {
		return movPath;
	}
	public void setMovPath(String movPath) {
		this.movPath = movPath;
	}
	public int getMovThumCnt() {
		return movThumCnt;
	}
	public void setMovThumCnt(int movThumCnt) {
		this.movThumCnt = movThumCnt;
	}
	public String getMovExt() {
		return movExt;
	}
	public void setMovExt(String movExt) {
		this.movExt = movExt;
	}
	public String getMovStd() {
		return movStd;
	}
	public void setMovStd(String movStd) {
		this.movStd = movStd;
	}
	public String getMovCreAt() {
		return movCreAt;
	}
	public void setMovCreAt(String movCreAt) {
		this.movCreAt = movCreAt;
	}
	public String getTrcCreCyl() {
		return trcCreCyl;
	}
	public void setTrcCreCyl(String trcCreCyl) {
		this.trcCreCyl = trcCreCyl;
	}
	public String getAutoRegAt() {
		return autoRegAt;
	}
	public void setAutoRegAt(String autoRegAt) {
		this.autoRegAt = autoRegAt;
	}
	public String getCpiAt() {
		return cpiAt;
	}
	public void setCpiAt(String cpiAt) {
		this.cpiAt = cpiAt;
	}
	public String getCpiTyp() {
		return cpiTyp;
	}
	public void setCpiTyp(String cpiTyp) {
		this.cpiTyp = cpiTyp;
	}
	public String getBtm() {
		return btm;
	}
	public void setBtm(String btm) {
		this.btm = btm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
