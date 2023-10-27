package kr.co.xicom.front.model;

import org.apache.commons.lang3.StringUtils;

import java.io.File;

public class BoardVO extends DefaultVO{


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

	private String  lnk						= "";	//게시판 링크

	//Do 추가 2023-02-09
	private String keyword ="";  //검색어
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// WildRain 추가 2023-01-13
	/**
	 * FileUploader.js에 의해 업로드된 파일 리스트 (JSON 문자열)
	 */
	private String jsonFileList;

	/**
	 * FileUploader.js에 의해 삭제된 파일 리스트 (JSON 문자열)
	 */
	private String jsonDeletedFileList;
	/**
	 * 대표 이미지 경로
	 */
	private String imgPath;


	//카드뉴스 썸네일
	private String file_path;
	private String saved_file_nm;
	private String file_nm;

	public String getSavedFilePath() {
		if (!StringUtils.endsWith(this.file_path, File.separator)) {
			this.file_path = this.file_path + File.separator;
		}
		return this.file_path + this.saved_file_nm;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getSaved_file_nm() {
		return saved_file_nm;
	}

	public void setSaved_file_nm(String saved_file_nm) {
		this.saved_file_nm = saved_file_nm;
	}
	public String getFile_nm() {
		return file_nm;
	}

	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
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

	public String getJsonFileList() {
		return this.jsonFileList;
	}

	public void setJsonFileList(String jsonFileList) {
		this.jsonFileList = jsonFileList;
	}

	public String getJsonDeletedFileList() {
		return this.jsonDeletedFileList;
	}

	public void setJsonDeletedFileList(String jsonDeletedFileList) {
		this.jsonDeletedFileList = jsonDeletedFileList;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	private String siteUrl ="";
	private String chkInfo ="";
	private String features ="";
	private String chrg ="";
	public String getSiteUrl() {
		return siteUrl;
	}

	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}

	public String getChkInfo() {
		return chkInfo;
	}

	public void setChkInfo(String chkInfo) {
		this.chkInfo = chkInfo;
	}

	public String getFeatures() {
		return features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public String getChrg() {
		return chrg;
	}

	public void setChrg(String chrg) {
		this.chrg = chrg;
	}

}
