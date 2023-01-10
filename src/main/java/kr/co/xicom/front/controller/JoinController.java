package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.AgreementVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CmpSttusVO;
import kr.co.xicom.front.service.AgreementService;
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
import java.util.List;
import java.util.Map;

@RequestMapping("/join")
@Controller
public class JoinController {

    @Autowired
    private ConsultingService service;
    @Autowired
    private AgreementService agreementService;

    //동행기업 신청 리스트
    @GetMapping(value = "/joinList.do")
    public ModelAndView list(ModelMap model,
                             @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                             HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/apply/join_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(cmpVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(cmpVO.getPageSize());

        cmpVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        cmpVO.setLastIndex(paginationInfo.getLastRecordIndex());
        cmpVO.setPageUnit(paginationInfo.getRecordCountPerPage());
        cmpVO.setMem_cd("M302"); //회원구분

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

    //동행기업 신청 화면
    @GetMapping(value = "/joinApply.do")
    public ModelAndView apply(HttpSession session,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/apply/join_apply");
        return mav;
    }

    @RequestMapping(value = "/joinApply.do", method = {RequestMethod.POST})
    public void doApply(ModelMap model,
                        @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                        @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                        HttpServletRequest request,
                        HttpServletResponse response) throws Exception {

        try {
            String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
            cmpVO.setBizNo(bizNo);
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            cmpVO.setMem_cd("M302");
            stVO.setBizNo(bizNo);
            int result = service.insertJoinApply(cmpVO, stVO);
            if (result > 0) {

                response.sendRedirect(request.getContextPath() + "/join/joinList.do");

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

    //비밀번호 확인
    @ResponseBody
    @RequestMapping(value = "/joinChkPw.do", method = {RequestMethod.POST})
    public String chkPasswd(ModelMap model,
                            @RequestParam(value = "bizNo") String bizNo,
                            @RequestParam(value = "passwd") String passwd,
                            @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        cmpVO.setBizNo(bizNo);
        cmpVO.setPasswd(passwd);

        int result = 0;
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

    //신청 상세 화면
    @GetMapping(value = "/joinView.do")
    public ModelAndView view(ModelMap model,
                             @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                             @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                             @RequestParam(value = "bizNo") String bizNo,
                             HttpSession session,
                             HttpServletRequest request,
                             HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/apply/join_view");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M302");
        try {
            List<CmpSttusVO> sttus = service.getCmpSttus(stVO);

            CmpMemberVo rs = service.getViewByBizNo(cmpVO);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
            if (rs == null && sttus == null) {
                System.out.println("비정상적인 접근입니다.");
            }

            mav.addObject("rs", rs);
            mav.addObject("st", sttus);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //약정서 작성
    @GetMapping(value = "/agree.do")
    public ModelAndView agree(HttpSession session,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/agreement/agree_apply");
        return mav;
    }

    @RequestMapping(value = "/agree.do", method = {RequestMethod.POST})
    public void doAgree(HttpSession session,
                        HttpServletRequest request,
                        HttpServletResponse response,
                        @ModelAttribute("AgreementVO") AgreementVO vo
    ) throws Exception {
              vo.setId(session.getId());
        try {
            int result = agreementService.apply(vo);
            if (result > 0) {

                response.sendRedirect(request.getContextPath() + "/join/agreeView.do");

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
    @GetMapping(value = "/agreeView.do")
    public ModelAndView agreeView(@ModelAttribute("AgreementVO") AgreementVO vo,
                            HttpSession session,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("join/agreement/agree_view");

        try {
            AgreementVO rs = agreementService.agreeView(session.getId());

            if (rs == null ) {
                System.out.println("비정상적인 접근입니다.");
            }

            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
}
