package kr.go.smes.tags;

import org.apache.commons.lang3.StringUtils;

/**
 * 포맷 적용을 위한 JSTL 함수 라이브러리.
 * @author WildRain
 * @since 2022-05-13
 */
public class CustomFormat {

    /**
     * 전화번호 서식 적용.
     * 출처: https://goni9071.tistory.com/174
     * @param src 서식이 적용되어있지 않은 전화번호
     * @return
     */
    public static String formatPhoneNumber(String src) {

        if (StringUtils.isEmpty(src)) {
            return "";
        }

        // '-' 문자를 모두 제거한다.
        String target = src.replaceAll("[^0-9]", "");

        if (target.length() == 7) {
            return target.replaceFirst("^([0-9]{3})([0-9]{4})$", "$1-$2");
        }
        if (target.length() == 8) {
            return target.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2");
        }
        else if (target.length() == 12) {
            return src.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4})$", "$1-$2-$3");
        }

        return target.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");

    }

    /**
     * 사업자등록번호 서식 적용.
     * @param src 서식이 적용되어있지 않은 사업자등록번호.
     * @return
     */
    public static String formatBizRegNumber(String src) {
        if (StringUtils.isEmpty(src)) {
            return "";
        }

        String target = src.replaceAll("[^0-9]", "");

        if (target.length() == 10) {
            return src.replaceFirst("(^[0-9]{3})([0-9]{2})([0-9]{5})$", "$1-$2-$3");
        }
        else {
            return src;
        }
    }

    /**
     * 법인등록번호 서식 적용.
     * @param src 서식이 적용되어있지 않은 법인등록번호
     * @return
     */
    public static String formatCorpNumber(String src) {
        if (StringUtils.isEmpty(src)) {
            return "";
        }
        String target = src.replaceAll("[^0-9]", "");
        if (target.length() == 13) {
            return target.replaceFirst("^([0-9]{6})([0-9]{7})$", "$1-$2");
        }
        else {
            return src;
        }
    }

    /**
     * 주민등록번호 서식 적용. 뒤쪽 6개 숫자는 마스킹 처리 됨.
     * @param src 서식이 적용되어있지 않은 주민등록 번호.
     * @return
     */
    public static String formatResiNumber(String src) {
        if (StringUtils.isEmpty(src)) {
            return "";
        }
        String target = src.replaceAll("[^0-9]", "");
        if (target.length() == 13) {
            return target.replaceFirst("^([0-9]{6})([0-9]{1})([0-9]{6})$", "$1-$2*****");
        }
        else {
            return src;
        }
    }

    /**
     * 날짜 서식(YYYY-MM-DD) 적용.
     * @param src 날짜 문자열.
     * @return
     */
    public static String formatDate(String src) {
        if (StringUtils.isEmpty(src)) {
            return "";
        }
        String target = src.replaceAll("[^0-9]", "");
        if (target.length() == 8) {
            return target.replaceFirst("^([0-9]{4})([0-9]{2})([0-9]{2})$", "$1-$2-$3");
        }
        else {
            return src;
        }
    }

    public static String formatUnit(Object src, String unit) {
        if (src == null) {
            return "";
        }
        String target = src.toString();
        if (StringUtils.isEmpty(target)) {
            return "";
        }
        if (StringUtils.isEmpty(unit)) {
            return target;
        }
        return String.format("%s %s", target, unit);
    }

//    public static String formatUnit(int src, String unit) {
//        if (StringUtils.isEmpty(unit)) {
//            return src + "";
//        }
//        return String.format("%d %s", src, unit);
//    }


}
