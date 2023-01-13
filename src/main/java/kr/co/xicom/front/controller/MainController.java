package kr.co.xicom.front.controller;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CmpSttusVO;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * 메인
 */

@RequestMapping("/main")
@Controller
public class MainController {
    @Autowired
    MainService mainService;
    @Autowired
    private ConsultingService consultingService;

    @GetMapping(value = "/index.do")
    public ModelAndView main(ModelMap model,
                             HttpServletRequest request,
                             HttpServletResponse response)
            throws Exception {

        ModelAndView mav = new ModelAndView("main");
        return mav;
    }

    @GetMapping("/login.do")
    public ModelAndView login(ModelMap model,
                              HttpServletRequest request,
                              HttpServletResponse response) throws Exception {

        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping(value = "/login.do", method = {RequestMethod.POST})
    public void memberLogin(@ModelAttribute("CmpMemberVo") CmpMemberVo vo,
                            HttpServletRequest request,
                            HttpServletResponse response) throws Exception {

        int login = mainService.memberLogin(vo);

        if (login == 1) {
            String bizNo = mainService.memberBizno(vo.getId());
            HttpSession session = request.getSession();
            session.setAttribute("sessionId", vo.getId());
            session.setAttribute("sessionBizNo", bizNo);
            response.sendRedirect(request.getContextPath() + "/main/index.do");
        } else {
            PrintWriter writer = response.getWriter();

            response.setContentType("text/html; charset=UTF-8;");
            request.setCharacterEncoding("utf-8");
            writer.println("<script type='text/javascript'>");
            writer.println("alert('아이디 또는 비밀번호를 확인해주세요.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.flush();
        }
    }

    @GetMapping("/logout.do")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/main/index.do";
    }

    /**
     * 마이페이지
     */
    @GetMapping(value = "/myPage.do")
    public ModelAndView view(ModelMap model,
                             @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                             @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
                             HttpSession session) throws Exception {

        ModelAndView mav = new ModelAndView("myPage/myPage");
        String bizNo = (String) session.getAttribute("sessionBizNo");

        cmpVO.setBizNo(bizNo);
        cmpVO.setMem_cd("M302");
        try {
            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);

            CmpMemberVo rs = mainService.getMemInfo(cmpVO);
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

    //수정 화면
    @GetMapping(value = "/joinEdit.do")
    public ModelAndView joinEdit(
            ModelMap model,
            @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
            @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
            HttpServletRequest request,
            HttpSession session
    ) throws Exception {
        ModelAndView mav = new ModelAndView("myPage/myPage_edit");

        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
        cmpVO.setMem_cd("M302");
        try {
            List<CmpSttusVO> sttus = consultingService.getCmpSttus(stVO);
            CmpMemberVo rs = mainService.getMemInfo(cmpVO);
            rs.setBizNo1(rs.getBizNo().substring(0, 3));
            rs.setBizNo2(rs.getBizNo().substring(3, 5));
            rs.setBizNo3(rs.getBizNo().substring(5, 10));
            if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }

            mav.addObject("rs", rs);
            mav.addObject("st", sttus);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }

    //수정 처리
    @RequestMapping(value = "/joinEdit.do", method = {RequestMethod.POST})
    public String doJoinEdit(
            ModelMap model,
            @ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
            @ModelAttribute("CmpSttusVO") CmpSttusVO stVO,
            HttpServletRequest request,
            HttpServletResponse response,
            HttpSession session) throws Exception {

        try {
            String bizNo = cmpVO.getBizNo1() + cmpVO.getBizNo2() + cmpVO.getBizNo3();
            cmpVO.setBizNo(bizNo);
            stVO.setBizNo(bizNo);

            int result = consultingService.updateJoin(cmpVO, stVO);

            if (result > 0) {
                return "redirect:myPage.do";
            } else {

                return "forward:/common/error.jsp";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }

    /**
     * 담당자 관리 메뉴
     */
    @GetMapping("/management.do")
    public ModelAndView memManage(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                                    ,HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("myPage/member_list");
        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
        try {
            List<CmpMemberVo> result = mainService.memManage(cmpVO);
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
    @GetMapping("/memAdd.do")
    public ModelAndView memAdd(HttpSession session) throws Exception{
        ModelAndView mav = new ModelAndView("myPage/member_add");
        return mav;
    }

    @RequestMapping(value = "/memAdd.do",method = {RequestMethod.POST})
    public void doMemAdd(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                          , HttpSession session
                          , HttpServletResponse response
                          , HttpServletRequest request) throws Exception {
        cmpVO.setManagement_cd("M502");
        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
        String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
        cmpVO.setEmail(email);
            int result = mainService.memAdd(cmpVO);
            if(result>0){
                response.sendRedirect(request.getContextPath() + "/main/management.do");
            }
                PrintWriter writer = response.getWriter();

                response.setContentType("text/html; charset=UTF-8;");
                request.setCharacterEncoding("utf-8");
                writer.println("<script type='text/javascript'>");
                writer.println("alert('데이터 저장 중 오류가 발생하였습니다.');");
                writer.println("history.back();");
                writer.println("</script>");
                writer.flush();
        }
    //수정 화면
    @GetMapping(value = "/memEdit.do")
    public ModelAndView memEdit(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                                ,HttpServletRequest request
                                ,HttpSession session
                                ) throws Exception {
        ModelAndView mav = new ModelAndView("myPage/member_edit");

        cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
        cmpVO.setId((String)session.getAttribute("sessionId"));
        try {
            CmpMemberVo rs = mainService.memEdit(cmpVO);
            String[] email = rs.getEmail().split("@");
            rs.setEmail1(email[0]);
            rs.setEmail2(email[1]);
            if (rs == null) {
                System.out.println("비정상적인 접근입니다.");
            }
            mav.addObject("rs", rs);

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return mav;
    }
    //수정 처리
    @RequestMapping(value = "/memEdit.do", method = {RequestMethod.POST})
    public String doMemEdit(@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO,
                            HttpSession session) throws Exception {
        try {
            cmpVO.setBizNo((String) session.getAttribute("sessionBizNo"));
            cmpVO.setId((String)session.getAttribute("sessionId"));
            String email = cmpVO.getEmail1() + '@' + cmpVO.getEmail2();
            cmpVO.setEmail(email);
            int result = mainService.updateMem(cmpVO);

            if (result > 0) {
                return "redirect:management.do";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return "forward:/common/error.jsp";
    }
    @GetMapping(value = "/changePw.do")
    public ModelAndView change(HttpSession session) throws Exception{
        ModelAndView mav = new ModelAndView("myPage/changePw");
        return mav;
    }

    @RequestMapping(value = "/changePw.do", method = {RequestMethod.POST})
    public void changePw(HttpSession session
                         ,@ModelAttribute("CmpMemberVo") CmpMemberVo cmpVO
                         ,HttpServletResponse response
                         ,HttpServletRequest request) throws Exception {

        int result = mainService.changePw(cmpVO);
        if(result>0){
            response.sendRedirect(request.getContextPath() + "/main/management.do");
        }
        PrintWriter writer = response.getWriter();

        response.setContentType("text/html; charset=UTF-8;");
        request.setCharacterEncoding("utf-8");
        writer.println("<script type='text/javascript'>");
        writer.println("alert('데이터 저장 중 오류가 발생하였습니다.');");
        writer.println("history.back();");
        writer.println("</script>");
        writer.flush();
    }
}
