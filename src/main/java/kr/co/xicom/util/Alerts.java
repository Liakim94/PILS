package kr.co.xicom.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

public class Alerts {

		protected Logger logger = LoggerFactory.getLogger(getClass());


	    /**
	     * 데이터 오류 Alert 출력
	     * @param request
	     * @param response
	     * @throws Exception
	     */
		public void writeDbErrorAlert(HttpServletRequest request,
									  HttpServletResponse response
		) throws Exception{
			writeAlert("데이터 저장중 오류가 발생 하였습니다.", request, response);
		}


	    /**
	     * 기타 Alert 출력
	     * @param message
	     * @param request
	     * @param response
	     * @throws Exception
	     */
		public void writeAlert(String message,
							   HttpServletRequest request,
							   HttpServletResponse response
		) throws Exception{

			PrintWriter writer = response.getWriter();
			String msg = message;
			response.setContentType("text/html; charset=UTF-8;");
			request.setCharacterEncoding("UTF-8");
			writer.println("<script type='text/javascript'>");
			writer.println("alert('" + msg + "');");
			writer.println("history.back();");

			writer.println("</script>");
			writer.flush();

		}
}
	

