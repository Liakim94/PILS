package kr.go.smes.util;

/**
 * Html Tag 관련된 유틸 모음.
 * @author WildRain
 * @since 2023-01-04
 */
public class HtmlTagUtils {

    // 참조 : https://velog.io/@hsgin11/ckeditor%EB%A1%9C-%EA%B8%80-%EB%93%B1%EB%A1%9D%ED%95%98%EA%B3%A0-%EB%93%B1%EB%A1%9D%ED%95%9C-%EA%B8%80%EC%9D%84-%EB%B3%BC-%EB%95%8C-html-%ED%83%9C%EA%B7%B8%EA%B0%80-%EA%B7%B8%EB%8C%80%EB%A1%9C-%EB%B3%B4%EC%9D%B4%EB%8A%94-%EA%B2%BD%EC%9A%B0-%EC%B0%B8%EA%B3%A0-%EA%B8%80
    public static String restore(String filterd) {
        String restored = filterd;
        restored = restored.replace("&lt;", "<");
        restored = restored.replace("&gt;", ">");
        restored = restored.replace("&amp;", "&");
        restored = restored.replace("&quot;", "\"");
        restored = restored.replace("&apos;", "\'");
        return unscript(restored);
    }

    public static String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;/embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;/form");

        ret = ret.replaceAll("<(M|m)(E|e)(T|t)(A|a)", "&lt;meta");
        ret = ret.replaceAll("</(M|m)(E|e)(T|t)(A|a)", "&lt;/meta");

        ret = ret.replaceAll("<(I|i)(F|f)(R|r)(A|a)(M|m)(E|e)", "&lt;iframe");
        ret = ret.replaceAll("</(I|i)(F|f)(R|r)(A|a)(M|m)(E|e)", "&lt;/iframe");

        //preg_replace('/(<.+?)(?<=\s)on[a-z]+\s*=\s*(?:([\'"])(?!\2).+?\2|(?:\S+?\(.*?\)(?=[\s>])))(.*?>)/ig', "$1 $3", $string);
        //ret = ret.replaceAll("(O|o)(N|n)(E|e)(R|r)(R|r)(O|o)(R|r)", "xxx");

        return ret;
    }
}
