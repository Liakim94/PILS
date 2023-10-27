package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class QnaVO extends DefaultVO{

	private int no = 0;
	private int headnum = 0;
	private int arrangenum =0;
	private int depth =0;
	private String id ="";
	private String passwd="";
	private String name ="";
	private String title ="";
	private String body ="";
	private String ip ="";
	private String rdate ="";
	private String reply ="";
	private String replyDe ="";
	private String email ="";

	/** Capchar 번호 */
	private String answer;
//
//
//
//	public String getReplyDe() {
//		return replyDe;
//	}
//	public void setReplyDe(String replyDe) {
//		this.replyDe = replyDe;
//	}
//	public String getReply() {
//		return reply;
//	}
//	public void setReply(String reply) {
//		this.reply = reply;
//	}
//	public String getRdate() {
//		return rdate;
//	}
//	public void setRdate(String rdate) {
//		this.rdate = rdate;
//	}
//	public int getNo() {
//		return no;
//	}
//	public void setNo(int no) {
//		this.no = no;
//	}
//	public int getHeadnum() {
//		return headnum;
//	}
//	public void setHeadnum(int headnum) {
//		this.headnum = headnum;
//	}
//	public int getArrangenum() {
//		return arrangenum;
//	}
//	public void setArrangenum(int arrangenum) {
//		this.arrangenum = arrangenum;
//	}
//	public int getDepth() {
//		return depth;
//	}
//	public void setDepth(int depth) {
//		this.depth = depth;
//	}
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//
//	public String getPasswd() {
//		return passwd;
//	}
//	public void setPasswd(String passwd) {
//		this.passwd = passwd;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public String getBody() {
//		return body;
//	}
//	public void setBody(String body) {
//		this.body = body;
//	}
//	public String getIp() {
//		return ip;
//	}
//	public void setIp(String ip) {
//		this.ip = ip;
//	}


}
