package kr.co.xicom.cms.model;

import kr.co.xicom.cmmn.model.DefaultVO;

/**
 * @Class Name : CommmentVO.java
 * @Description : CommentVO Class
 * @Modification Information
 * @
 * @  수정일	  수정자		      수정내용
 * @ ---------	---------	-------------------------------
 * @ 2018.05.02   백상진              최초생성
 *
 *  Copyright (C) by XICOM All right reserved.
 */
public class CommentVO extends DefaultVO{
	
	private static final long serialVersionUID = 1L;

	private int 	cmtSeq					=  0;
	private String 	cont					= "";
	private int 	lke						=  0;
	private int 	dLke					=  0;
	private int 	grd						=  0;
	private int 	boardSeq				=  0;
	private int 	bbsId					=  0;
	private String	usrTyp					= "";
	
	
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public int getCmtSeq() {
		return cmtSeq;
	}
	public void setCmtSeq(int cmtSeq) {
		this.cmtSeq = cmtSeq;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public int getLke() {
		return lke;
	}
	public void setLke(int lke) {
		this.lke = lke;
	}
	public int getdLke() {
		return dLke;
	}
	public void setdLke(int dLke) {
		this.dLke = dLke;
	}
	public int getGrd() {
		return grd;
	}
	public void setGrd(int grd) {
		this.grd = grd;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getUsrTyp() {
		return usrTyp;
	}
	public void setUsrTyp(String usrTyp) {
		this.usrTyp = usrTyp;
	}
	
}
