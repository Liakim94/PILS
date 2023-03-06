package kr.co.xicom;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageInterceptor extends HandlerInterceptorAdapter{


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

                HttpSession session = request.getSession();
                String id = (String)session.getAttribute("sessionId");

                if(id ==null){
                    response.sendRedirect(request.getContextPath()+"/main/login.do");
                    return false;
                }else{
                    return super.preHandle(request, response, handler);
                }

        }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{

        super.postHandle(request, response, handler, modelAndView);
    }



}