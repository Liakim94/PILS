package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.BbsQnaVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.ConsultingService;
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

@Controller
public class ConsultingController {
    @Autowired
    private ConsultingService service;

    //컨설팅 신청 리스트
    @GetMapping(value="/consulting.do")
    public ModelAndView list(ModelMap model,
                             @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                             HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response)throws Exception{

        ModelAndView mav = new ModelAndView("main/consulting/con_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(cmpVO.getPageIndex());	// 현재페이지
        paginationInfo.setRecordCountPerPage(15);					// 한 페이지당 게시물갯수
        paginationInfo.setPageSize(cmpVO.getPageSize());

        cmpVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        cmpVO.setLastIndex(paginationInfo.getLastRecordIndex());
        cmpVO.setPageUnit(paginationInfo.getRecordCountPerPage());

        Map<String, Object> rs = new HashMap<String, Object>();
        rs = service.list(cmpVO);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("vo", cmpVO);


        return mav;
    }

    //컨설팅 신청 화면
    @GetMapping(value="/conApply.do")
    public ModelAndView apply(HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response)throws Exception {

        ModelAndView mav = new ModelAndView("main/consulting/con_apply");
        return mav;
    }

    @RequestMapping(value="/consulting.do",  method={RequestMethod.POST})
    public void doApply(ModelMap model,
                       @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                       HttpServletRequest request,
                       HttpServletResponse response)throws Exception{

        try {
            String bizNo=request.getParameter("bizNo1")+request.getParameter("bizNo2")+request.getParameter("bizNo3");
            cmpVO.setBizNo(bizNo);
            String email=request.getParameter("email1")+'@'+request.getParameter("email2");
            cmpVO.setEmail(email);

            int result = service.insertConsulting(cmpVO);

            if(result > 0){

                response.sendRedirect(request.getContextPath()+"/qnaList.do");

            }else{
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

    //신청 상세 화면
    @ResponseBody
    @RequestMapping(value="/conChkPw.do", method={RequestMethod.POST})
    public String chkPasswd(ModelMap model,
                            @RequestParam(value="bizNo") String bizNo,
                            @RequestParam(value ="passwd") String passwd,
                            @ModelAttribute("CmpMemberVo")CmpMemberVo cmpVO,
                            HttpServletRequest request,
                            HttpServletResponse response)throws Exception {

        cmpVO.setBizNo(bizNo);
        cmpVO.setPasswd(passwd);

        int result =0;
        try {
            result = service.conChkPw(cmpVO);
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        if (result == 1) {
            return "1";
        } else {
            return "0";

        }
    }

}
