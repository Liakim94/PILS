package kr.co.xicom.front.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@Builder
@ToString
public class VisitLogVO extends DefaultVO{

	private int seq = 0;
	private String ip ="";
	private String url ="";
	private String referer ="";
	private String userAgent ="";
	private String visit_date ="";

}
