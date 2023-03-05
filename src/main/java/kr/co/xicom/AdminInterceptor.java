package kr.co.xicom;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.cmmn.web.EgovWebUtil;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.util.Utils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

public class AdminInterceptor extends HandlerInterceptorAdapter{

    private static final Logger LOGGER = LoggerFactory.getLogger(AdminInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

            LOGGER.debug("============> LLLLLLLLL");
            try {
                HttpSession session = request.getSession();
                String admId = (String)session.getAttribute("sessionId");
                System.out.println(admId);

                if(admId==null || !admId.equals("admin")){
                    LOGGER.debug("=========> " + admId);
                    response.sendRedirect(request.getContextPath()+"/common/deny.jsp");
                    return false;
                }else{
                    return super.preHandle(request, response, handler);
                }
            } catch (Exception e) {
                return false;
            }
        }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception{

        super.postHandle(request, response, handler, modelAndView);
    }



}