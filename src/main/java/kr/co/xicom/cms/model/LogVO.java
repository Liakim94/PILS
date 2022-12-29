package kr.co.xicom.cms.model;

import kr.co.xicom.cmmn.model.DefaultVO;

/**
 * 0. Project  : XICMS
 *
 * 1. FileName  : LogVO.java
 * 2. Package   : kr.co.xicom.cms.model
 * 3. History   : 
 * ┌───────────────────────────----───────────┐
 * │    Date      	 │   Writer	 │   Comment  │
 * │	2020. 3. 6.	 │   백상진	 │  최초생성  │
 * └─────────────────────────────-─----───────┘  
 */
public class LogVO extends DefaultVO{

	private int seq 			= 0; 
	private String accDe		= "";
	private String ip			= "";
	private String wb			= "";
	private String empSeq		= "";
	private String empId		= "";
	private String memSeq		= "";
	private String memId		= "";
	private String accType		= "";
	
	private String year			= "";
	private String month		= "";
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getAccDe() {
		return accDe;
	}
	public void setAccDe(String accDe) {
		this.accDe = accDe;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getWb() {
		return wb;
	}
	public void setWb(String wb) {
		this.wb = wb;
	}
	public String getEmpSeq() {
		return empSeq;
	}
	public void setEmpSeq(String empSeq) {
		this.empSeq = empSeq;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getAccType() {
		return accType;
	}
	public void setAccType(String accType) {
		this.accType = accType;
	}
	
	
}
