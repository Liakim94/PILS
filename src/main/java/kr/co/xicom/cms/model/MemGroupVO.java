package kr.co.xicom.cms.model;

import kr.co.xicom.cmmn.model.DefaultVO;

public class MemGroupVO extends DefaultVO {

	private int grpSeq		= 0; // 회원 그룹 일련번호
	private String grpNm	= ""; // 회원 그룹명
	private int regSeq		= 0; // 등록자 일련번호
	private String regDe	= ""; // 등록일
	private int updSeq		= 0; // 수정자 일련번호
	private String updDe	= ""; // 수정일
	private String useAt	= ""; // 사용여부
	
	private int pMemSeq	= 1;
	private String sort		= "";
	private int 	old_parent	= 0;
	private int 	position	= 0;
	private int 	old_position= 0;
	
	
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
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public int getpMemSeq() {
		return pMemSeq;
	}
	public void setpMemSeq(int pMemSeq) {
		this.pMemSeq = pMemSeq;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getOld_parent() {
		return old_parent;
	}
	public void setOld_parent(int old_parent) {
		this.old_parent = old_parent;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getOld_position() {
		return old_position;
	}
	public void setOld_position(int old_position) {
		this.old_position = old_position;
	}
	
	
}
