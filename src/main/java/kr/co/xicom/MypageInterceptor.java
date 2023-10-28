package kr.co.xicom;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class MypageInterceptor extends HandlerInterceptorAdapter{


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

                HttpSession session = request.getSession();
                String id = (String)session.getAttribute("sessionId");

                if(id ==null){
                    PrintWriter out = response.getWriter();
                    response.setContentType("text/html;charset=UTF-8");
                    out.println("<script>alert('로그인이 필요합니다.'); location.href='"+request.getContextPath()+"/main/login.do"+"';</script>");
                    out.flush();
                    return false;
                }else{
                    return super.preHandle(request, response, handler);
                }

        }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{

        super.postHandle(request, response, handler, modelAndView);
    }



}