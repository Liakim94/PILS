package kr.co.xicom.front.controller;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.CompanyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CompanyController {

    /** Logger */
    private static final Logger LOGGER = LoggerFactory.getLogger(CompanyController.class);

    /** 참여기업 서비스 */
    @Resource
    private CompanyService companyService;

    /**
     * 참여기업 현황 페이지 출력
     */
    @RequestMapping("/front/guide/company/list.do")
    public ModelAndView list() throws Exception {

        ModelAndView mav = new ModelAndView("guide/company/list");

        List<CmpMemberVo> list = this.companyService.list();

        mav.addObject("list", list);

        return mav;
    }
}
