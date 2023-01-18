package kr.co.xicom.front.controller;

import kr.co.xicom.util.Alerts;
import org.bouncycastle.jcajce.provider.asymmetric.ec.KeyFactorySpi;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/front")
@Controller
public class GuideController extends Alerts {

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
     * 납품대금 연동제란? - 적용대상 페이지 출력
     */
    @RequestMapping("/guide/appliesto.do")
    public String appliesTo() throws Exception {
        return "guide/appliesto";
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
}
