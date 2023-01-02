package kr.co.xicom.front.model;

import kr.co.xicom.cmmn.model.DefaultVO;

/**
 * @Class Name : BoardVO.java
 * @Description : BoardVO Class
 * @Modification Information
 * @
 * @  수정일	  수정자		      수정내용
 * @ ---------	---------	-------------------------------
 * @ 2018.04.11   백상진              최초생성
 *
 *  Copyright (C) by XICOM All right reserved.
 */
public class BoardVO extends DefaultVO{
	
	/** 옵션
	 
	[TB_BOARD - STAT]		0:사용안함 1:사용 4:완전삭제 8:임시저장삭제 9:임시저장
	
	[TB_BOARD - USR_TYP]	MEM:회원  GST : 게스트  EMP:사원

	 */
	
	private static final long serialVersionUID = 1L;
	
	private int 	boardSeq 				=  0;  // 게시물번호
	private int 	bbsId					=  0;  // 게시판아이디
	private String 	steId					=  ""; // 사이트아이디
	private String	bbsNm					= "";  // 게시판명
	private String 	title					= "";  // 제목
	private String	cont 					= "";  // 내용
	private String  pwd						= "";  // 비밀번호
	private float	ref						=  0;  // 참조번호
	private int 	lvl						=  0;  // 레벨
	private int 	step					=  0;  // 스텝
	private String  notiAt					= "";  // 공지여부
	
	private int 	readCnt					=  0;  // 조회수
	private String  usrTyp					= "";  // 사용자유형
	private String  notiStrDt				= "";  // 공지시작일자
	private String  notiEndDt				= "";  // 공지종료일자
	private String  opnAt					= "";  // 공개여부
	private String  tag						= "";  // 태그
	
	private String  fileStd					= "";  // 첨부파일 규격

	private String 	chkNo[]					= null;	// 리스트 체크박스	
	
	//	TB_BOARD_LIKE	//
	private int 	likeSeq					=  0;	// TB_BOARD_Like 번호
	private int 	like					=  0;	// 좋아요
	private int 	dislike					=  0;	// 싫어요
	
	
	private String  lnk						= "";	//게시판 링크
	
	
	public String getSteId() {
		return steId;
	}
	public void setSteId(String steId) {
		this.steId = steId;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getLikeSeq() {
		return likeSeq;
	}
	public void setLikeSeq(int likeSeq) {
		this.likeSeq = likeSeq;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getDislike() {
		return dislike;
	}
	public void setDislike(int dislike) {
		this.dislike = dislike;
	}
	public String getFileStd() {
		return fileStd;
	}
	public void setFileStd(String fileStd) {
		this.fileStd = fileStd;
	}
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
	public String getBbsNm() {
		return bbsNm;
	}
	public void setBbsNm(String bbsNm) {
		this.bbsNm = bbsNm;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public float getRef() {
		return ref;
	}
	public void setRef(float ref) {
		this.ref = ref;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getNotiAt() {
		return notiAt;
	}
	public void setNotiAt(String notiAt) {
		this.notiAt = notiAt;
	}
	public int getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	public String getUsrTyp() {
		return usrTyp;
	}
	public void setUsrTyp(String usrTyp) {
		this.usrTyp = usrTyp;
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
	public String getOpnAt() {
		return opnAt;
	}
	public void setOpnAt(String opnAt) {
		this.opnAt = opnAt;
	}
	public String getLnk() {
		return lnk;
	}
	public void setLnk(String lnk) {
		this.lnk = lnk;
	}
	
	
	
}
