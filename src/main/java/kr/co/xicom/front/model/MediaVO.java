package kr.co.xicom.front.model;

import kr.co.xicom.cmmn.model.DefaultVO;

/**
 * @Class Name : MediaVO.java
 * @Description : MediaVO Class
 * @Modification Information
 * @
 * @  수정일		 수정자		 수정내용
 * @ ---------	---------	-------------------------------
 * @ 2017.01.20 전중재          최초생성
 *
 *  Copyright (C) by XICOM All right reserved.
 */
public class MediaVO extends DefaultVO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8778728457471651838L;
	private int		mdaSeq		= 0;					//순번
	private String 	mdaNm		= "";					//미디어명
	private String 	fileNm		= "";					//파일명
	private float	fileSz		= 0;					//파일사이즈
	private String	filePath	= "";					//파일경로
	private String	svFileNm	= "";					//SV파일명
	private String	capt		= "";					//캡션
	private String	alt			= "";					//ALT
	private String	fileMime	= "";					//파일MIME
	private String	fileMeta	= "";					//파일META
	private int		regSeq		= 0;					//등록자 번호
	private String	regDe		= "";					//등록일시
	private int		updSeq		= 0;					//수정자 번호
	private String	updDe		= "";					//수정일시
	private char	flag		= 'F';					//쿼리분기
	private String	uc			= "";					//사용중 카운트
	private String	tc			= "";					//사용중 카운트
	private String	chkNo[]		= null;					// 리스트 체크박스
	private String	id			= "";					//id
	private String steId ="";
	private String shareAt = "";
	
	
	public int getMdaSeq() {
		return mdaSeq;
	}
	public void setMdaSeq(int mdaSeq) {
		this.mdaSeq = mdaSeq;
	}
	public String getMdaNm() {
		return mdaNm;
	}
	public void setMdaNm(String mdaNm) {
		this.mdaNm = mdaNm;
	}
	public String getFileNm() {
		return fileNm;
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public float getFileSz() {
		return fileSz;
	}
	public void setFileSz(float fileSz) {
		this.fileSz = fileSz;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getSvFileNm() {
		return svFileNm;
	}
	public void setSvFileNm(String svFileNm) {
		this.svFileNm = svFileNm;
	}
	public String getCapt() {
		return capt;
	}
	public void setCapt(String capt) {
		this.capt = capt;
	}
	public String getAlt() {
		return alt;
	}
	public void setAlt(String alt) {
		this.alt = alt;
	}
	public String getFileMime() {
		return fileMime;
	}
	public void setFileMime(String fileMime) {
		this.fileMime = fileMime;
	}
	public String getFileMeta() {
		return fileMeta;
	}
	public void setFileMeta(String fileMeta) {
		this.fileMeta = fileMeta;
	}
	public char getFlag() {
		return flag;
	}
	public void setFlag(char flag) {
		this.flag = flag;
	}
	public int getRegSeq() {
		return regSeq;
	}
	public void setRegSeq(int regSeq) {
		this.regSeq = regSeq;
	}
	public String getRegDe() {
		return regDe;
	}
	public void setRegDe(String regDe) {
		this.regDe = regDe;
	}
	public int getUpdSeq() {
		return updSeq;
	}
	public void setUpdSeq(int updSeq) {
		this.updSeq = updSeq;
	}
	public String getUpdDe() {
		return updDe;
	}
	public void setUpdDe(String updDe) {
		this.updDe = updDe;
	}
	public String getUc() {
		return uc;
	}
	public void setUc(String uc) {
		this.uc = uc;
	}
	public String getTc() {
		return tc;
	}
	public void setTc(String tc) {
		this.tc = tc;
	}
	public String[] getChkNo() {
		String[] arrEmpList = null;
		if(chkNo != null){
			arrEmpList = new String[chkNo.length];
			for(int i = 0; i < chkNo.length; i++){arrEmpList[i] = this.chkNo[i];}
		}
		return arrEmpList;
	}
	public void setChkNo(String[] chkNo) {
		this.chkNo = new String[chkNo.length];
		for(int i = 0; i < chkNo.length; i++)
			this.chkNo[i] = chkNo[i];
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSteId() {
		return steId;
	}
	public void setSteId(String steId) {
		this.steId = steId;
	}
	public String getShareAt() {
		return shareAt;
	}
	public void setShareAt(String shareAt) {
		this.shareAt = shareAt;
	}
	
	
}