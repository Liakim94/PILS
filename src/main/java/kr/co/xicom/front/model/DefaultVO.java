/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package kr.co.xicom.front.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : DefaultVO.java
 * @Description : DefaultVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
public class DefaultVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	
	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 0;

	/** lastIndex */
	private int lastIndex = 1;
	
	private int regSeq 		= 0;
	private String regNm 	= "";
	private String regDe 	= "";
	private int updSeq 		= 0;
	private String updNm 	= "";
	private String updDe 	= "";
	private String stat		= "";
	private String statNm	= "";
	
	private String regIp	= ""; // 작성자 아이피
	private String regWb	= ""; // 작성자 브라우저
	private String regWbs	= ""; // 작성자 브라우저 심플
	private String updIp	= "";
	private String updWb	= "";
	private String updWbs	= "";

	private String 	authList				= "";	// 권한목록
	private String	authTyp					= "";	// 권한타입
	private String	authRwx					= "";   // 권한
	private int		authSeq					=  0;	// 권한아이디
	private String	authText				= "";	// 권한부서/사용자명
	
	
	
	private String	arrRwxEmp[]				= null; // 사원권한 배열
	private String	arrRwxGrp[]				= null; // 그룹권한 배열
	private String	arrRwxDept[]			= null; // 부서권한 배열
	
	private int		arrSeqEmp[]				= null; // 사원권한아이디 배열
	private int		arrSeqGrp[]				= null; // 그룹권한아이디 배열
	private int		arrSeqDept[]			= null; // 부서권한아이디 배열
	

	
	public String getAuthList() {
		return authList;
	}
	public void setAuthList(String authList) {
		this.authList = authList;
	}
	public String getAuthRwx() {
		return authRwx;
	}
	public void setAuthRwx(String authRwx) {
		this.authRwx = authRwx;
	}
	public int getAuthSeq() {
		return authSeq;
	}
	public void setAuthSeq(int authSeq) {
		this.authSeq = authSeq;
	}
	public String getAuthTyp() {
		return authTyp;
	}
	public void setAuthTyp(String authTyp) {
		this.authTyp = authTyp;
	}
	public String getAuthText() {
		return authText;
	}
	public void setAuthText(String authText) {
		this.authText = authText;
	}
	public String[] getArrRwxEmp() {
		String[] rwxEmp = null;
		if(arrRwxEmp != null){
			rwxEmp = new String[arrRwxEmp.length];
			for(int i = 0; i < arrRwxEmp.length; i++){rwxEmp[i] = this.arrRwxEmp[i];}
		}
		return rwxEmp;
	}
	public void setArrRwxEmp(String[] arrRwxEmp) {
		this.arrRwxEmp = new String[arrRwxEmp.length];
		for(int i = 0; i < arrRwxEmp.length; i++)
			this.arrRwxEmp[i] = arrRwxEmp[i];
	}
	public String[] getArrRwxGrp() {
		String[] rwxGrp = null;
		if(arrRwxGrp != null){
			rwxGrp = new String[arrRwxGrp.length];
			for(int i = 0; i < arrRwxGrp.length; i++){rwxGrp[i] = this.arrRwxGrp[i];}
		}
		return rwxGrp;
	}
	public void setArrRwxGrp(String[] arrRwxGrp) {
		this.arrRwxGrp = new String[arrRwxGrp.length];
		for(int i = 0; i < arrRwxGrp.length; i++)
			this.arrRwxGrp[i] = arrRwxGrp[i];
	}
	public String[] getArrRwxDept() {
		String[] rwxDept = null;
		if(arrRwxDept != null){
			rwxDept = new String[arrRwxDept.length];
			for(int i = 0; i < arrRwxDept.length; i++){rwxDept[i] = this.arrRwxDept[i];}
		}
		return rwxDept;
	}
	public void setArrRwxDept(String[] arrRwxDept) {
		this.arrRwxDept = new String[arrRwxDept.length];
		for(int i = 0; i < arrRwxDept.length; i++)
			this.arrRwxDept[i] = arrRwxDept[i];
	}
	public int[] getArrSeqEmp() {
		int[] seqEmp = null;
		if(arrSeqEmp != null){
			seqEmp = new int[arrSeqEmp.length];
			for(int i = 0; i < arrSeqEmp.length; i++){seqEmp[i] = this.arrSeqEmp[i];}
		}
		return seqEmp;
	}
	public void setArrSeqEmp(int[] arrSeqEmp) {
		this.arrSeqEmp = new int[arrSeqEmp.length];
		for(int i = 0; i < arrSeqEmp.length; i++)
			this.arrSeqEmp[i] = arrSeqEmp[i];
	}
	public int[] getArrSeqGrp() {
		int[] seqGrp = null;
		if(arrSeqGrp != null){
			seqGrp = new int[arrSeqGrp.length];
			for(int i = 0; i < arrSeqGrp.length; i++){seqGrp[i] = this.arrSeqGrp[i];}
		}
		return seqGrp;
	}
	public void setArrSeqGrp(int[] arrSeqGrp) {
		this.arrSeqGrp = new int[arrSeqGrp.length];
		for(int i = 0; i < arrSeqGrp.length; i++)
			this.arrSeqGrp[i] = arrSeqGrp[i];
	}
	public int[] getArrSeqDept() {
		int[] sepDept = null;
		if(arrSeqDept != null){
			sepDept = new int[arrSeqDept.length];
			for(int i = 0; i < arrSeqDept.length; i++){sepDept[i] = this.arrSeqDept[i];}
		}
		return sepDept;
	}
	public void setArrSeqDept(int[] arrSeqDept) {
		this.arrSeqDept = new int[arrSeqDept.length];
		for(int i = 0; i < arrSeqDept.length; i++)
			this.arrSeqDept[i] = arrSeqDept[i];
	}
	
	

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}


	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	

	public int getRegSeq() {
		return regSeq;
	}

	public void setRegSeq(int regSeq) {
		this.regSeq = regSeq;
	}

	public String getRegNm() {
		return regNm;
	}

	public void setRegNm(String regNm) {
		this.regNm = regNm;
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

	public String getUpdNm() {
		return updNm;
	}

	public void setUpdNm(String updNm) {
		this.updNm = updNm;
	}

	public String getUpdDe() {
		return updDe;
	}

	public void setUpdDe(String updDe) {
		this.updDe = updDe;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getStatNm() {
		return statNm;
	}

	public void setStatNm(String statNm) {
		this.statNm = statNm;
	}

	public String getRegIp() {
		return regIp;
	}

	public void setRegIp(String regIp) {
		this.regIp = regIp;
	}

	public String getRegWb() {
		return regWb;
	}

	public void setRegWb(String regWb) {
		this.regWb = regWb;
	}

	public String getUpdIp() {
		return updIp;
	}

	public void setUpdIp(String updIp) {
		this.updIp = updIp;
	}

	public String getUpdWb() {
		return updWb;
	}

	public void setUpdWb(String updWb) {
		this.updWb = updWb;
	}
	public String getRegWbs() {
		return regWbs;
	}

	public void setRegWbs(String regWbs) {
		this.regWbs = regWbs;
	}

	public String getUpdWbs() {
		return updWbs;
	}

	public void setUpdWbs(String updWbs) {
		this.updWbs = updWbs;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
