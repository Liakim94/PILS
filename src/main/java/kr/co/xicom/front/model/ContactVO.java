package kr.co.xicom.front.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
public class ContactVO extends DefaultVO{

	private Integer seq;
	private Integer sortSeq;
	private String instNm ="";
	private String contact ="";
	private String upDt ="";

}
