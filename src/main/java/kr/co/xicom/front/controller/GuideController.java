package kr.co.xicom.front.controller;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.util.Alerts;
import org.bouncycastle.jcajce.provider.asymmetric.ec.KeyFactorySpi;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/front")
@Controller
public class GuideController extends Alerts {
    @Autowired
    ConsultingService consultingService;
    @Autowired
    AdminService adminService;

    private static final Logger LOGGER = LoggerFactory.getLogger(GuideController.class);

    @RequestMapping("/guide/index.do")
    public String index() throws Exception {
        return "redirect:/front/guide/background.do";
    }

    /**
     * 납품대금 연동제란? - 도입배경 페이지 출력
     */
    @RequestMapping("/guide/background.do")
    public String backgrouind() throws Exception {
        return "guide/background";
    }

    /**
     * 납품대금 연동제란? - 개념 페이지 출력
     */
    @RequestMapping("/guide/concept.do")
    public String concept() throws Exception {
        return "guide/concept";
    }

    /**
     * 납품대금 연동제란? - 걸어온 발자취 페이지 출력
     */
    @RequestMapping("/guide/trace.do")
    public ModelAndView trace(@ModelAttribute("TraceVo")TraceVO vo) throws Exception {
        ModelAndView mav = new ModelAndView("guide/trace");
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(vo.getPageIndex());
        paginationInfo.setRecordCountPerPage(15);
        paginationInfo.setPageSize(vo.getPageSize());

        vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
        vo.setLastIndex(paginationInfo.getLastRecordIndex());
        vo.setPageUnit(paginationInfo.getRecordCountPerPage());
        Map<String, Object> result = new HashMap<String, Object>();
        result = adminService.traceList(vo);

        int totalCnt = 0;
        totalCnt = Integer.parseInt(String.valueOf(result.get("resultCnt")));
        paginationInfo.setTotalRecordCount(totalCnt);

        mav.addObject("rs", result.get("resultList"));
        mav.addObject("totalCnt", result.get("resultCnt"));

        mav.addObject("paginationInfo", paginationInfo);

        return mav;
    }
    @RequestMapping("/guide/trace/view.do")
    public ModelAndView traceView(@RequestParam(value = "seq") int seq
                                  ,@ModelAttribute("TraceVO")TraceVO vo)throws Exception{
        ModelAndView mav = new ModelAndView("guide/trace_view");

        vo = adminService.traceView(seq);
        vo.setSeq(seq);
        mav.addObject("rs",  vo);
        return mav;
    }

    /**
     * 납품대금 연동제란? - 관련 법령 페이지 출력
     */
    @RequestMapping("/guide/ordinance.do")
    public String ordinance() throws Exception {
        return "guide/ordinance";
    }

    /**
     * 납품대금 연동제란? - 주요 통계 페이지 출력
     */
    @RequestMapping("/guide/statistics.do")
    public String statistics() throws Exception {
        return "guide/statistics";

    }

//    /**
//     * 참여기업 현황
//     */
//    @RequestMapping("/guide/cmpList.do")
//    public ModelAndView cmpList(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVo) throws Exception {
//        ModelAndView mav = new ModelAndView("guide/company/details");
//        cmpVo.setMem_cd("M302"); //회원구분
//
//        Map<String, Object> rs = new HashMap<String, Object>();
//        rs = consultingService.list(cmpVo);
//        mav.addObject("list", rs.get("resultList"));
//
//        return mav ;
//
//    }
//    /**
//     * 참여기업 현황
//     */
//    @RequestMapping("/guide/cmpDetail.do")
//    public ModelAndView cmpDetail(@RequestParam(value = "bizNo") String bizNo
//                                 ,@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVo)
//                                  throws Exception {
//        ModelAndView mav = new ModelAndView("guide/cmpDetail");
//        cmpVo.setBizNo(bizNo);
//        cmpVo.setMem_cd("M302");
//        cmpVo = consultingService.getViewByBizNo(cmpVo);
//        mav.addObject("list", cmpVo);
//        return mav;
//
//    }
//
//    /**
//     * 참여기업 현황 정보 수정 페이지
//     */
//    @GetMapping("/guide/cmpEdit.do")
//    public ModelAndView cmpEdit(@RequestParam String bizNo,
//                                @ModelAttribute(" cmpMember") CmpMemberVo cmpMemberVo) throws Exception {
//
//        ModelAndView mav = new ModelAndView("guide/cmpEdit");
//
//        cmpMemberVo.setBizNo(bizNo);
//        cmpMemberVo.setMem_cd("M302");
//        cmpMemberVo = consultingService.getViewByBizNo(cmpMemberVo);
//        mav.addObject("cmpMember", cmpMemberVo);
//
//        return mav;
//    }
}
