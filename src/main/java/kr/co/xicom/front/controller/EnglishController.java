package kr.co.xicom.front.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.co.xicom.front.model.*;
import kr.co.xicom.front.service.*;
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

@RequestMapping("/en")
@Controller
public class EnglishController {
    @Autowired
    MainService mainService;
    @Autowired
    private ConsultingService consultingService;

    @GetMapping(value = "/header.do")
    public ModelAndView header(ModelMap model,
                               HttpServletRequest request,
                               HttpServletResponse response,
                               HttpSession session)
            throws Exception {
        ModelAndView mav = new ModelAndView("english/header");
        return mav;
    }

    /**
     * Menu 동행기업신청
     */
    @GetMapping(value = "/menu_join.do")
    public ModelAndView menu(ModelMap model,
                             HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session)
            throws Exception {
        ModelAndView mav = null;
        mav = new ModelAndView("english/menu_join");
        return mav;
    }
    /**
     * Menu
     */
    @GetMapping(value = "/menu_guide.do")
    public ModelAndView menuGuide(ModelMap model,
                             HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session)
            throws Exception {
        ModelAndView mav = new ModelAndView("english/guide_menu");
        return mav;
    }

    @GetMapping(value = "/index.do")
    public ModelAndView main(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVo,
                             @ModelAttribute("BannerVO")BannerVO bannerVO) throws Exception {
        ModelAndView mav = new ModelAndView("english/main");

        cmpVo.setMem_cd("M302"); //회원구분
        Map<String, Object> rs = new HashMap<String, Object>();
        rs = consultingService.list(cmpVo);

        List<BannerVO> banner = mainService.bannerAll(bannerVO);

        mav.addObject("banner", banner);
        mav.addObject("list", rs.get("resultList"));
        mav.addObject("cnt", rs.get("resultCnt"));
        mav.addObject("joinCmpCnt", rs.get("joinCmpCnt"));
        return mav;
    }
    /**
     * concept 페이지 출력
     */
    @RequestMapping("/guide/concept.do")
    public ModelAndView concept() throws Exception {
        ModelAndView mav = new ModelAndView("english/concept");
        return mav;
    }
    /**
     * Learn about the price indexation process
     */
    @RequestMapping("/guide/process.do")
    public ModelAndView process() throws Exception {
        ModelAndView mav = new ModelAndView("english/process");
        return mav;
    }
    /**
     * Notes regarding the price indexation system
     */
    @RequestMapping("/guide/notice.do")
    public ModelAndView notice() throws Exception {
        ModelAndView mav = new ModelAndView("english/notice");
        return mav;
    }
    /**
     * How to Make Indexation Table like subcontract payment
     */
    @RequestMapping("/guide/agree.do")
    public ModelAndView agree() throws Exception {
        ModelAndView mav = new ModelAndView("english/agree");
        return mav;
    }
    /**
     * How to make stndard non-indexation contract
     */
    @RequestMapping("/guide/contract.do")
    public ModelAndView contract() throws Exception {
        ModelAndView mav = new ModelAndView("english/contract");
        return mav;
    }
    /**
     * Related laws
     */
    @RequestMapping("/guide/ordinance.do")
    public ModelAndView ordinance() throws Exception {
        ModelAndView mav = new ModelAndView("english/ordinance");
        return mav;
    }
    /**
     * What is a partner company?
     */
    @RequestMapping("/join/concept.do")
    public ModelAndView joinConcept() throws Exception {
        ModelAndView mav = new ModelAndView("english/join_concept");
        return mav;
    }
    /**
     *Incentive offered to partner company
     */
    @RequestMapping("/join/incentive.do")
    public ModelAndView incentive() throws Exception {
        ModelAndView mav = new ModelAndView("english/incentive");
        return mav;
    }
    /**
     *Partner company application
     */
    @RequestMapping("/join/apply.do")
    public ModelAndView joinApply() throws Exception {
        ModelAndView mav = new ModelAndView("english/join_apply");
        return mav;
    }
}
