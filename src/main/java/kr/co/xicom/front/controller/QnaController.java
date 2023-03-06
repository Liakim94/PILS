package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.QnaVO;
import kr.co.xicom.front.service.QnaService;
import kr.co.xicom.util.Alerts;
import kr.co.xicom.util.CaptchaUtil;
import nl.captcha.Captcha;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequestMapping("/front")
@Controller
public class QnaController extends Alerts {

    /**
     * Logger
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(QnaController.class);

    @Autowired
    private QnaService qnaService;

    @GetMapping(value = "/qna/main.do")
    public ModelAndView qnaMain() throws Exception {
        ModelAndView mav = new ModelAndView("communication/qna/main");
        return mav;
    }

    /**
     * 1:1문의 목록
     */
    @GetMapping(value = "/qna/list.do")
    public ModelAndView list(ModelMap model,
                             @ModelAttribute("QnaVO") QnaVO VO,
                             HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/qna/list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(VO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(VO.getPageSize());

        VO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        VO.setLastIndex(paginationInfo.getLastRecordIndex());
        VO.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = new HashMap<String, Object>();
        rs = qnaService.list(VO);

        List<QnaVO> qnaVOList = (List<QnaVO>) rs.get("resultList");
        qnaVOList.forEach(qnaVO -> {
            qnaVO.setTitle(qnaVO.getTitle().replaceAll("(?<=.{2}).", "*"));
        });

        int totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("vo", VO);
        mav.addObject("rwx", request.getAttribute("rwx"));


        return mav;
    }

    /**
     * 1:1문의 등록 화면
     */
    @GetMapping(value = "/qna/post.do")
    public ModelAndView post(ModelMap model,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/qna/post");

        return mav;
    }

    /**
     * 1:1문의 등록
     */
    @RequestMapping(value = "/qna/post.do", method = {RequestMethod.POST})
    public void doPost(ModelMap model,
                       @ModelAttribute("QnaVO") QnaVO qnaVO,
                       HttpSession session,
                       HttpServletRequest request,
                       HttpServletResponse response) throws Exception {

        Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
        String answer = qnaVO.getAnswer();

        if (StringUtils.isBlank(answer)) {
            // 이미 클라이언트에서 해당 값(answer)에 빈값을 체크 할것이므르로
            // 이럴일은 없겠지만 방어 코딩 필요.
        }

        if (!captcha.isCorrect(answer)) {
            response.setContentType("text/html; charset=UTF-8;");
            PrintWriter writer = response.getWriter();
            writer.println("<script type='text/javascript'>");
            writer.println("alert('이미지에 보이는 정확한 숫자을 입력하세요.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
            return;
        }
        else {
            session.removeAttribute(Captcha.NAME);
        }

        try {
            int result = qnaService.insertBbsQna(qnaVO);
            if (result > 0) {

                session = request.getSession();
                session.setAttribute("qnaId", qnaVO.getNo());
                request.setAttribute("hid", "");
                response.sendRedirect(request.getContextPath() + "/front/qna/view.do?no="+qnaVO.getNo());

            } else {
                PrintWriter writer = response.getWriter();

                response.setContentType("text/html; charset=UTF-8;");
                request.setCharacterEncoding("utf-8");
                writer.println("<script type='text/javascript'>");
                writer.println("alert('데이터 저장 중 오류가 발생하였습니다.');");
                writer.println("history.back();");
                writer.println("</script>");
                writer.flush();
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
        }
    }

    /**
     * 비밀번호 확인
     */
    @RequestMapping(value = "/chkPasswd.do", method = {RequestMethod.POST})
    public String chkPasswd(ModelMap model,
                            @RequestParam(value = "no") int no,
                            @RequestParam(value = "passwd") String passwd,
                            @ModelAttribute("QnaVO") QnaVO qnaVO,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        qnaVO.setNo(no);
        qnaVO.setPasswd(passwd);

        int result = 0;
        try {
            result = qnaService.chkPasswd(qnaVO);
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        if (result == 1) {
           HttpSession session = request.getSession();
            session.setAttribute("qnaId", qnaVO.getNo());
            return "redirect:/front/qna/view.do?no=" + no;
        } else {
            return "forward:/common/deny.jsp";

        }
    }

    /**
     * 1:1문의 상세 화면
     */
    @GetMapping(value = "/qna/view.do")
    public ModelAndView view(ModelMap model,
                             @ModelAttribute("QnaVO") QnaVO qnaVO,
                             @RequestParam(value = "no") int no,
                             HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/qna/view");

        boolean isAccess = false;
        boolean isAdmin = false;
        String sId = (String) session.getAttribute("sessionId");
        int qId = (int) session.getAttribute("qnaId");
        System.out.println((int) session.getAttribute("qnaId"));
        // admin이면
        if (sId != null && sId.equals("admin")) {
            isAdmin = true;
            isAccess = true;
        }

        // admin도 아니고 작성자도 아니면 접속거부
        if (qId == 0 && !isAdmin) {
            response.sendRedirect(request.getContextPath() + "/common/deny.jsp");
        } else {
            if (!isAdmin) {
                // 작성자
                int qint = (int) session.getAttribute("qnaId");
                if (qint == no) {
                    isAccess = true;
                }
            }
        }

        if (!isAccess) {
            response.sendRedirect(request.getContextPath() + "/common/deny.jsp");
        }

        qnaVO.setNo(no);
        QnaVO rs = qnaService.getBbsQnabyId(qnaVO);

        if (rs == null) {
            writeAlert("비정상적인 접근입니다.", request, response);
        }

        mav.addObject("rs", rs);
        mav.addObject("vo", qnaVO);

        return mav;
    }

    @GetMapping(value = "/qna/delete.do")
    public void qnaDelete(@RequestParam(value = "no") int no
            , @ModelAttribute("QnaVO") QnaVO qnaVO
            , HttpServletRequest request
            , HttpServletResponse response) throws Exception {
        //DO 23-03-06 관리자만 질의 삭제 가능으로 변경
//        String clientIp = request.getHeader("X-FORWARDED-FOR");
//        if (clientIp == null) clientIp = request.getRemoteAddr();
//        QnaVO rs = qnaService.getBbsQnabyId(qnaVO);
//        //ip 주소가 같은 경우에만 처리
//        if (!rs.getIp().equals(clientIp)) {
//            response.sendRedirect(request.getContextPath() + "/common/deny.jsp");
//        } else {
            int result = qnaService.qnaDelete(no);
            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/front/qna/list.do");
        }


    }

    /**
     * 1:1문의 답변 화면
     */
    @GetMapping(value = "/qna/repost.do")
    public ModelAndView repost(ModelMap model,
                               @ModelAttribute("QnaVO") QnaVO qnaVO,
                               @RequestParam(value = "no") int no,
                               HttpSession session,
                               HttpServletRequest request,
                               HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/qna/repost");

        qnaVO.setNo(no);
        QnaVO rs = qnaService.getBbsQnabyId(qnaVO);

        mav.addObject("rs", rs);
        mav.addObject("vo", qnaVO);

        return mav;
    }

    /**
     * 1:1문의 답변
     */
    @RequestMapping(value = "/qna/repost.do", method = {RequestMethod.POST})
    public void doRepost(ModelMap model,
                         @ModelAttribute("QnaVO") QnaVO qnaVO,
                         HttpServletRequest request,
                         HttpServletResponse response) throws Exception {

        try {
            int result = qnaService.repostBbsQna(qnaVO);

            if (result > 0) {

                request.setAttribute("hid", "");
                response.sendRedirect(request.getContextPath() + "/front/qna/view.do?no="+qnaVO.getNo());

            } else {
                PrintWriter writer = response.getWriter();

                response.setContentType("text/html; charset=UTF-8;");
                request.setCharacterEncoding("utf-8");
                writer.println("<script type='text/javascript'>");
                writer.println("alert('데이터 저장 중 오류가 발생하였습니다.');");
                writer.println("history.back();");
                writer.println("</script>");
                writer.flush();
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }

    }

    // 보안문자 이미지 가져오기
    @RequestMapping(value = "/qna/getCaptchaImg")
    @ResponseBody
    public void captchaImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
        new CaptchaUtil().captcaImg(request, response);
    }

    // 사용자가 입력한 보안문자 체크하는 메서드
    @PostMapping("/qna/chkAnswer.do")
    @ResponseBody
    public String chkAnswer(HttpServletRequest req, HttpServletResponse res) {
        String result = "";
        Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
        String ans = req.getParameter("answer");
        System.out.println("ddddddd"+ans);
        if (ans != null && !"".equals(ans)) {
            if (captcha.isCorrect(ans)) {
                req.getSession().removeAttribute(Captcha.NAME);
                result = "200";
            } else {
                result = "300";
            }
        }
        return result;
    }

}
