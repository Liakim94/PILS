package kr.co.xicom.cms.model;

import kr.co.xicom.cmmn.model.DefaultVO;

/**
 * @Class Name : CodeVO.java
 * @Description : CodeVO Class
 * @Modification Information
 * @
 * @  수정일		 수정자		 수정내용
 * @ ---------	---------	-------------------------------
 * @ 2017.09.06 전중재          최초생성
 *
 *  Copyright (C) by XICOM All right reserved.
 */
public class CodeVO extends DefaultVO {
	
	private static final long serialVersionUID = -1577936843798531370L;
	
	private String ctgr			= "";	//카테고리
	private String cd			= "";	//코드
	private String cdNm			= "";	//코드명
	private String cdDesc		= "";	//코드설명
	private String rsv1			= "";	//예약1
	private String rsv2			= "";	//예약2
	private String rsv3			= "";	//예약3
	private int sort			= 0;	//순서
	private String useAt		= "";	//사용여부
	
	public String getCtgr() {
		return ctgr;
	}
	public void setCtgr(String ctgr) {
		this.ctgr = ctgr;
	}
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getCdDesc() {
		return cdDesc;
	}
	public void setCdDesc(String cdDesc) {
		this.cdDesc = cdDesc;
	}
	public String getRsv1() {
		return rsv1;
	}
	public void setRsv1(String rsv1) {
		this.rsv1 = rsv1;
	}
	public String getRsv2() {
		return rsv2;
	}
	public void setRsv2(String rsv2) {
		this.rsv2 = rsv2;
	}
	public String getRsv3() {
		return rsv3;
	}
	public void setRsv3(String rsv3) {
		this.rsv3 = rsv3;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	
	
}