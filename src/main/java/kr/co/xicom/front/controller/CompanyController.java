package kr.co.xicom.front.controller;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.CompanyService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * 참여기업 현황 Controller.
 * @author WildRain
 * @since 2023-01-27
 */
@Controller
public class CompanyController {

    /** Logger */
    private static final Logger LOGGER = LoggerFactory.getLogger(CompanyController.class);

    /** 참여기업 서비스 */
    @Resource
    private CompanyService companyService;

    /**
     * 참여기업 현황 리스트 페이지 출력
     */
    @RequestMapping("/front/guide/company/list.do")
    public ModelAndView list() throws Exception {

        ModelAndView mav = new ModelAndView("guide/company/list");

        List<CmpMemberVo> list = this.companyService.list();

        mav.addObject("list", list);

        return mav;
    }

    /**
     * 참여기업 현황 상세 페이지 출력
     * @param bizNo 사업자번호
     * @return
     * @throws Exception
     */
    @RequestMapping("/front/guide/company/details.do")
    public ModelAndView details(@RequestParam String bizNo) throws Exception {

        ModelAndView mav = new ModelAndView("guide/company/details");

        CmpMemberVo cmpMemberVo = this.companyService.details(bizNo);

        mav.addObject("company", cmpMemberVo);

        return mav;
    }

    /**
     * 참여기업 현황 수정 페이지 출력
     * @param bizNo 사업자번호
     * @param cmpMemberVo
     * @return
     * @throws Exception
     */
    @GetMapping("/front/guide/company/edit.do")
    public ModelAndView edit(@RequestParam String bizNo,
                             @ModelAttribute("company") CmpMemberVo cmpMemberVo) throws Exception {

        ModelAndView mav = new ModelAndView("guide/company/edit");

        mav.addObject("company", this.companyService.details(bizNo));

        return mav;
    }

    /**
     * 참여기업 현황 수정 처리.
     * @param bizNo 사업자번호
     * @param cmpMemberVo
     * @param errors
     * @return
     * @throws Exception
     */
    @PostMapping("/front/guide/company/edit.do")
    public String edit(@RequestParam String bizNo,
                             @ModelAttribute("company") CmpMemberVo cmpMemberVo,
                             BindingResult errors) throws Exception {

        this.companyService.update(cmpMemberVo);

        return "redirect:/front/guide/company/details.do?bizNo=" + bizNo;

    }
}
