package kr.co.xicom;

import kr.co.xicom.front.service.VisitLogService;
import kr.go.smes.util.RequestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 방문자, 페이이지뷰 카운트를 위한 Interceptor
 */
public class VisitLogInterceptor extends HandlerInterceptorAdapter {

    private static final Logger LOGGER = LoggerFactory.getLogger(VisitLogInterceptor.class);

    @Resource
    private VisitLogService visitLogService;

    public VisitLogInterceptor(VisitLogService visitLogService) {
        this.visitLogService = visitLogService;
    }

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler,
                           ModelAndView modelAndView) throws Exception {

        //LOGGER.debug(">>>>>>>>>> postHandle!!!!!");

        String referer = request.getHeader("referer");
        String ip = RequestUtils.getClientIp(request); // request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String url = request.getRequestURI();

        /*LOGGER.debug(">> ip : " + ip);
        LOGGER.debug(">> referer : " + referer);
        LOGGER.debug(">> user agent : " + userAgent);
        LOGGER.debug(">> url : " + url);*/

        visitLogService.log(ip, url, referer, userAgent);

    }

}