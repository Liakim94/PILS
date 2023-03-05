package kr.co.xicom.util;

import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

public class CaptchaUtil {

    public void captcaImg(HttpServletRequest request, HttpServletResponse response) {
        Captcha captcha = new Captcha.Builder(200, 60)
                .addText(new NumbersAnswerProducer(6))
                .addNoise().addNoise().addNoise()
                .addBackground(new GradiatedBackgroundProducer())
                .addBorder()
                .build();

//        response.setHeader("Cache-Control", "no-cache");
//        response.setDateHeader("Expires", 0);
//        response.setHeader("Pragma", "no-cache");
//        response.setDateHeader("Max-Age", 0);

        request.getSession().setAttribute(Captcha.NAME, captcha);
        CaptchaServletUtil.writeImage(response, captcha.getImage());
        System.out.println("image"+captcha.getAnswer());
    }

//
//    public Response chkAnswerProcess(HttpServletRequest request, HashMap<String, String> p) {
//        Response response = new Response();
//
//        response.setDataObj("1");
//
//        return response;
//    }
//
}
