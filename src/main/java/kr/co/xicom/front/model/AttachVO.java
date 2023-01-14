package kr.co.xicom.front.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;

public class AttachVO extends DefaultVO {

	private static final long serialVersionUID = -8374307720915348410L;

	@Expose
	private int 	attchSeq 					=  0;	// 첨부파일 일련번호
	@Expose
	private int 	bbsId						=  0;	// 게시판 아이디(일련번호)
	@Expose
	private int 	boardSeq					=  0;	// 게시물 일련번호
	@Expose
	private String 	fileExt						= "";	// 첨부파일 확장자
	@SerializedName("type")
	private String	fileMime					= "";	// 첨부파일 유형
	@SerializedName("name")
	private String	fileNm						= "";	// 첨부파일 명
	@SerializedName("size")
	private float 	fileSz						=  0;	// 첨부파일 용량
	@SerializedName("savedPath")
	private String 	filePath					= "";	// 첨부파일 저장위치
	@SerializedName("savedFileName")
	private String 	svFileNm					= "";	// 첨부파일 저장파일 명
	@Expose
	private String 	fileStd						= "";	// 첨부파일 규격
	@Expose
	private String	fileMeta					= "";	// 첨부파일 메타
	@Expose
	private String 	thumCreStat					= "";	// 썸네일 생성상태
	@Expose
	private String 	trcStat						= "";	// 트랜스코딩 상태
	@Expose
	private String 	usrTyp						= "";	// 사용자 유형
	@Expose
	private String 	useAt						= "";	// 사용여부


	//do 추가 23-01-15
	/**
	 * 동행기업 신청 첨부파일을 위해 필요한 columns
	 */
	@Expose
	private String 	bizNo						= "";	// 사업자번호
	@Expose
	private String 	attchCode						= "";	// 첨부파일 구분코드


	/*
	private CommonsMultipartFile[] file 	= null;
	private String[] arrFilename 			= null;
	private String[] arrOriginalFilename 	= null;
	private String[] arrFileext 			= null;
	private float[] arrFilesize				= null;
	private String[] arrFilepath 			= null;
	private String[] arrFiletype 			= null;
	private String[] arrFilestd 			= null;
	private int[] deletefile				= null;
	private int appSeq						= 0;
	private int contSeq						= 0;
	private int reqSeq						= 0;
	private int repSeq						= 0;
	private int pfSeq						= 0;
	private String 	pfNm					= "";
	private String ctgr						= "";
	*/

	// WildRain 추가 2023-01-13
	// 전체 파일 저장 경로 추출
	public String getSavedFilePath() {
		if (!StringUtils.endsWith(this.filePath, File.separator)) {
			this.filePath = this.filePath + File.separator;
		}
		return this.filePath + this.svFileNm;
	}

	/*public String getPfNm() {
		return pfNm;
	}
	public void setPfNm(String pfNm) {
		this.pfNm = pfNm;
	}
	public int getPfSeq() {
		return pfSeq;
	}
	public void setPfSeq(int pfSeq) {
		this.pfSeq = pfSeq;
	}
	public int getAppSeq() {
		return appSeq;
	}
	public void setAppSeq(int appSeq) {
		this.appSeq = appSeq;
	}
	public String getCtgr() {
		return ctgr;
	}
	public void setCtgr(String ctgr) {
		this.ctgr = ctgr;
	}
	public int getRepSeq() {
		return repSeq;
	}
	public void setRepSeq(int repSeq) {
		this.repSeq = repSeq;
	}
	public int getReqSeq() {
		return reqSeq;
	}
	public void setReqSeq(int reqSeq) {
		this.reqSeq = reqSeq;
	}
	public int getContSeq() {
		return contSeq;
	}
	public void setContSeq(int contSeq) {
		this.contSeq = contSeq;
	}*/
	public int getAttchSeq() {
		return attchSeq;
	}
	public void setAttchSeq(int attchSeq) {
		this.attchSeq = attchSeq;
	}
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getFileExt() {
		return fileExt;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public String getFileMime() {
		return fileMime;
	}
	public void setFileMime(String fileMime) {
		this.fileMime = fileMime;
	}
	public String getFileNm() {
		return fileNm.replaceAll("¶", ",");
	}
	public void setFileNm(String fileNm) {
		this.fileNm = fileNm.replaceAll(",", "¶");
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
	public String getFileStd() {
		return fileStd;
	}
	public void setFileStd(String fileStd) {
		this.fileStd = fileStd;
	}
	public String getThumCreStat() {
		return thumCreStat;
	}
	public void setThumCreStat(String thumCreStat) {
		this.thumCreStat = thumCreStat;
	}
	public String getTrcStat() {
		return trcStat;
	}
	public void setTrcStat(String trcStat) {
		this.trcStat = trcStat;
	}
	public String getUsrTyp() {
		return usrTyp;
	}
	public void setUsrTyp(String usrTyp) {
		this.usrTyp = usrTyp;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getBizNo() {
		return bizNo;
	}

	public void setBizNo(String bizNo) {
		this.bizNo = bizNo;
	}

	public String getAttchCode() {
		return attchCode;
	}

	public void setAttchCode(String attchCode) {
		this.attchCode = attchCode;
	}
	/*public CommonsMultipartFile[] getFile() {
		CommonsMultipartFile[] arrFiles = null;
		if(file != null){
			arrFiles = new CommonsMultipartFile[file.length];
			for(int i = 0; i < file.length; i++){arrFiles[i] = this.file[i];}
		}
		return arrFiles;
	}
	public void setFile(CommonsMultipartFile[] file) {
		this.file = new CommonsMultipartFile[file.length];
		for(int i = 0; i < file.length; i++)
			this.file[i] = file[i];
	}
	public String[] getArrFilename() {
		String[] filenameList = null;
		if(arrFilename != null){
			filenameList = new String[arrFilename.length];
			for(int i = 0; i < arrFilename.length; i++){filenameList[i] = this.arrFilename[i];}
		}
		return filenameList;
	}
	public void setArrFilename(String[] arrFilename) {
		this.arrFilename = new String[arrFilename.length];
		for(int i = 0; i < arrFilename.length; i++)
			this.arrFilename[i] = arrFilename[i];
	}

	public String[] getArrOriginalFilename() {
		String[] originalFilenameList = null;
		if(arrOriginalFilename != null){
			originalFilenameList = new String[arrOriginalFilename.length];
			for(int i = 0; i < arrOriginalFilename.length; i++){originalFilenameList[i] = this.arrOriginalFilename[i];}
		}
		return originalFilenameList;
	}
	public void setArrOriginalFilename(String[] arrOriginalFilename) {
		this.arrOriginalFilename = new String[arrOriginalFilename.length];
		for(int i = 0; i < arrOriginalFilename.length; i++)
			this.arrOriginalFilename[i] = arrOriginalFilename[i];
	}

	public String[] getArrFileext() {
		String[] fileextList = null;
		if(arrFileext != null){
			fileextList = new String[arrFileext.length];
			for(int i = 0; i < arrFileext.length; i++){fileextList[i] = this.arrFileext[i];}
		}
		return fileextList;
	}
	public void setArrFileext(String[] arrFileext) {
		this.arrFileext = new String[arrFileext.length];
		for(int i = 0; i < arrFileext.length; i++)
			this.arrFileext[i] = arrFileext[i];
	}

	public float[] getArrFilesize() {
		float[] filesizeList = null;
		if(arrFilesize != null){
			filesizeList = new float[arrFilesize.length];
			for(int i = 0; i < arrFilesize.length; i++){filesizeList[i] = this.arrFilesize[i];}
		}
		return filesizeList;
	}
	public void setArrFilesize(float[] arrFilesize) {
		this.arrFilesize = new float[arrFilesize.length];
		for(int i = 0; i < arrFilesize.length; i++)
			this.arrFilesize[i] = arrFilesize[i];
	}
	public String[] getArrFilepath() {
		String[] filepathList = null;
		if(arrFilepath != null){
			filepathList = new String[arrFilepath.length];
			for(int i = 0; i < arrFilepath.length; i++){filepathList[i] = this.arrFilepath[i];}
		}
		return filepathList;
	}
	public void setArrFilepath(String[] arrFilepath) {
		this.arrFilepath = new String[arrFilepath.length];
		for(int i = 0; i < arrFilepath.length; i++)
			this.arrFilepath[i] = arrFilepath[i];
	}

	public String[] getArrFiletype() {
		String[] filetypeList = null;
		if(arrFiletype != null){
			filetypeList = new String[arrFiletype.length];
			for(int i = 0; i < arrFiletype.length; i++){filetypeList[i] = this.arrFiletype[i];}
		}
		return filetypeList;
	}
	public void setArrFiletype(String[] arrFiletype) {
		this.arrFiletype = new String[arrFiletype.length];
		for(int i = 0; i < arrFiletype.length; i++)
			this.arrFiletype[i] = arrFiletype[i];
	}
	public String[] getArrFilestd() {
		String[] filestdList = null;
		if(arrFilestd != null){
			filestdList = new String[arrFilestd.length];
			for(int i = 0; i < arrFilestd.length; i++){filestdList[i] = this.arrFilestd[i];}
		}
		return filestdList;
	}
	public void setArrFilestd(String[] arrFilestd) {
		this.arrFilestd = new String[arrFilestd.length];
		for(int i = 0; i < arrFilestd.length; i++)
			this.arrFilestd[i] = arrFilestd[i];
	}

	public int[] getDeletefile() {
		int[] deletefiles = null;
		if(deletefile != null){
			deletefiles = new int[deletefile.length];
			for(int i = 0; i < deletefile.length; i++){deletefiles[i] = this.deletefile[i];}
		}
		return deletefiles;
	}
	public void setDeletefile(int[] deletefile) {
		this.deletefile = new int[deletefile.length];
		for(int i = 0; i < deletefile.length; i++)
			this.deletefile[i] = deletefile[i];
	}*/
	public String getFileMeta() {
		return fileMeta;
	}
	public void setFileMeta(String fileMeta) {
		this.fileMeta = fileMeta;
	}


}
