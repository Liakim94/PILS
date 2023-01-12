package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.QnaVO;
import kr.co.xicom.front.service.QnaService;
import kr.co.xicom.util.Alerts;
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
import java.util.Map;


@RequestMapping("/cmm")
@Controller
public class QnaController extends Alerts {

    @Autowired
    private QnaService service;

    /**
     * 1:1문의 목록
     */
    @GetMapping(value = "/qnaList.do")
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
        rs = service.list(VO);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
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
    @GetMapping(value = "/qnaPost.do")
    public ModelAndView post(ModelMap model,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/qna/post");

        return mav;
    }

    /**
     * 1:1문의 등록
     */
    @RequestMapping(value = "/qnaPost.do", method = {RequestMethod.POST})
    public void doPost(ModelMap model,
                       @ModelAttribute("QnaVO") QnaVO qnaVO,
                       HttpServletRequest request,
                       HttpServletResponse response) throws Exception {

        try {
            int result = service.insertBbsQna(qnaVO);

            if (result > 0) {

                request.setAttribute("hid", "");
                response.sendRedirect(request.getContextPath() + "/cmm/qnaList.do");

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

    /**
     * 비밀번호 확인
     */
    @ResponseBody
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
            result = service.chkPasswd(qnaVO);
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        if (result == 1) {
            return "1";
        } else {
            return "0";

        }
    }

    /**
     * 1:1문의 상세 화면
     */
    @GetMapping(value = "/qnaView.do")
    public ModelAndView view(ModelMap model,
                             @ModelAttribute("QnaVO") QnaVO qnaVO,
                             @RequestParam(value = "no") int no,
                             HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/qna/view");

        qnaVO.setNo(no);
        QnaVO rs = service.getBbsQnabyId(qnaVO);

        if (rs == null) {
            writeAlert("비정상적인 접근입니다.", request, response);
        }

        mav.addObject("rs", rs);
        mav.addObject("vo", qnaVO);

        return mav;
    }

    @GetMapping(value = "/qnaDelete.do")
    public void qnaDelete(@RequestParam(value = "no") int no
                         , HttpServletRequest request
                         , HttpServletResponse response) throws Exception {
        int result = service.qnaDelete(no);
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/cmm/qnaList.do");
        }
    }

    /**
     * 1:1문의 답변 화면
     *
     * @param
     * @return
     * @throws BusinessLogicException
     */
    @GetMapping(value = "/qnaRepost.do")
    public ModelAndView repost(ModelMap model,
                               @ModelAttribute("QnaVO") QnaVO qnaVO,
                               @RequestParam(value = "no") int no,
                               HttpSession session,
                               HttpServletRequest request,
                               HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("communication/qna/repost");

        qnaVO.setNo(no);
        QnaVO rs = service.getBbsQnabyId(qnaVO);

        mav.addObject("rs", rs);
        mav.addObject("vo", qnaVO);

        return mav;
    }

    /**
     * 1:1문의 답변
     *
     * @param
     * @return
     * @throws BusinessLogicException
     */
    @RequestMapping(value = "/qnaRepost.do", method = {RequestMethod.POST})
    public void doRepost(ModelMap model,
                         @ModelAttribute("QnaVO") QnaVO qnaVO,
                         HttpServletRequest request,
                         HttpServletResponse response) throws Exception {

        try {
            int result = service.repostBbsQna(qnaVO);

            if (result > 0) {

                request.setAttribute("hid", "");
                response.sendRedirect(request.getContextPath() + "/cmm/qnaList.do");

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


}
