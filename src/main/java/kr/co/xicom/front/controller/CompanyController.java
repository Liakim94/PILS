package kr.co.xicom.front.controller;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.CompanyService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpSession;
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
    public ModelAndView list(@ModelAttribute("vo") CmpMemberVo cmpMemberVo) throws Exception {

        ModelAndView mav = new ModelAndView("guide/company/list");
        List<CmpMemberVo> list = this.companyService.list(cmpMemberVo);

        mav.addObject("list", list);
        mav.addObject("vo", cmpMemberVo);
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
                             @ModelAttribute("company") CmpMemberVo cmpMemberVo,
                             HttpSession session) throws Exception {

        ModelAndView mav = new ModelAndView("guide/company/edit");

        // 권한 확인
        String sessionId = (String)session.getAttribute("sessionId");
        String sessionBizNo = (String)session.getAttribute("sessionBizNo");

        // 로그인 상태이며 운영자 이거나 해당 사업자인 경우에만 처리
        if (!StringUtils.isBlank(sessionId) && ("admin".equals(sessionId) || bizNo.equals(sessionBizNo))) {
            // 사업자번호에 해당하는 정보 추출
            mav.addObject("company", this.companyService.details(bizNo));
        }
        else {
            // 권한이 없는 경우 다시 details 화면으로 이동 처리
            mav.setViewName("redirect:/front/guide/company/details.do?bizNo=" + bizNo);
        }

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
                       BindingResult errors,
                       HttpSession session) throws Exception {

        // 권한 확인
        String sessionId = (String)session.getAttribute("sessionId");
        String sessionBizNo = (String)session.getAttribute("sessionBizNo");

        // 로그인 상태이며 운영자 이거나 해당 사업자인 경우에만 처리
        if (!StringUtils.isBlank(sessionId) && ("admin".equals(sessionId) || bizNo.equals(sessionBizNo))) {
            this.companyService.update(cmpMemberVo);
        }

        return "redirect:/front/guide/company/details.do?bizNo=" + bizNo;

    }
}
