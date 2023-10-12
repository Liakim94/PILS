package kr.co.xicom.front.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
public class ContactVO extends DefaultVO{

	private int seq = 0;
	private int sortSeq = 0;
	private String instNm ="";
	private String contact ="";
	private String upDt ="";

}
