package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/admin")
@Controller
public class adminController {
    @Autowired
    ConsultingService consultingService;
    @Autowired
    AdminService adminService;

    //동행기업 신청 현황
    @GetMapping(value = "/join/list.do")
    public ModelAndView joinList(ModelMap model,
                                 @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                                 HttpSession session,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("admin/join_list");

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
        rs = consultingService.list(cmpVO);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("vo", cmpVO);

        return mav;
    }
    //컨설팅 신청 현황
    @GetMapping(value = "/consulting/list.do")
    public ModelAndView conList(ModelMap model,
                                @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                                HttpSession session,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("admin/con_list");

        /*페이징 초기설정*/
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(cmpVO.getPageIndex());    // 현재페이지
        paginationInfo.setRecordCountPerPage(15);                    // 한 페이지당 게시물갯수
        paginationInfo.setPageSize(cmpVO.getPageSize());

        cmpVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        cmpVO.setLastIndex(paginationInfo.getLastRecordIndex());
        cmpVO.setPageUnit(paginationInfo.getRecordCountPerPage());
        cmpVO.setMem_cd("M301"); //회원구분

        Map<String, Object> rs = new HashMap<String, Object>();
        rs = consultingService.list(cmpVO);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(rs.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("totalCnt", rs.get("resultCnt"));
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("paginationInfo", paginationInfo);
        mav.addObject("vo", cmpVO);
        return mav;
    }
    //담당자 현황
    @GetMapping("/management/list.do")
    public ModelAndView memManage(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
            ,HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("admin/mem_list");
        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
        try {
            List<CmpMemberVo> result = adminService.memManageList(cmpVO);
            if (result == null) {
                ModelAndView error = new ModelAndView("common/error.jsp");
                return error;
            }
            mav.addObject("rs", result);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //걸어온 발자취 게시판 관리
    @GetMapping("/trace/post.do")
    public ModelAndView tracePost(@ModelAttribute("post")TraceVO vo
            , HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("admin/trace_post");
        return mav;
    }
    @PostMapping("/trace/post.do")
    public String doTracePost(@ModelAttribute("post")TraceVO vo)throws Exception {
        int result =adminService.tracePost(vo);
        if (result > 0) {
            vo.getSeq();
            return "redirect:/front/guide/trace/view.do?seq="+vo.getSeq();
        }
        else {
            return "forward:/common/error.jsp";
        }
    }
}
