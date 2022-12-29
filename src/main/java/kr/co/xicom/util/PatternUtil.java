package kr.co.xicom.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *  정규식 패턴 검사 UTIL
 * 
 * @author ohj
 *
 */
public class PatternUtil {

	public static final String PATTERNID = "^[A-Za-z[0-9]]{4,20}$"; // 영문, 숫자(4~20 자리)
	public static final String PATTERN1 = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*#?&])[A-Za-z[0-9]$@$!%*#?&]{6,20}$"; // 영문,숫자,특수문자
	public static final String PATTERN2 = "^[A-Za-z[0-9]]{10,20}$"; // 영문, 숫자(10~20 자리)
	public static final String PATTERN3 = "^[[0-9]$@$!%*#?&]{10,20}$"; // 영문,특수문자
	public static final String PATTERN4 = "^[[A-Za-z]$@$!%*#?&]{10,20}$"; // 특수문자,숫자
	public static final String PATTERN5 = "(\\w)\\1\\1\\1"; // 같은 문자, 숫자
	public static final String PATTERNEMAIL = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"; // email
	public static final String PATTERNTEL = "^\\d{2,3}-\\d{3,4}-\\d{4}$";//tel
	public static final String PATTERNPHONE = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$";//phone
	public static final String PATTERNNUMBER = "^[0-9]*$";//number

	/**
	 * 숫자 정규식 체크
	 * @param newId
	 * @return
	 */
	public static boolean isNumber(String str) {
		if(str == null)return false;
		boolean chk = false;

		Matcher match = Pattern.compile(PATTERNNUMBER).matcher(str);
		if (match.find()) {
			chk = true;
		}
		return chk;
	}
	/**
	 * 전화번호 정규식 체크
	 * @param newId
	 * @return
	 */
	public static boolean isTel(String str) {
		if(str == null)return false;
		boolean chk = false;

		Matcher match = Pattern.compile(PATTERNTEL).matcher(str);
		if (match.find()) {
			chk = true;
		}
		return chk;
	}
	/**
	 * 전화번호 정규식 체크
	 * @param newId
	 * @return
	 */
	public static boolean isPhone(String str) {
		if(str == null)return false;
		boolean chk = false;

		Matcher match = Pattern.compile(PATTERNPHONE).matcher(str);
		if (match.find()) {
			chk = true;
		}
		return chk;
	}
	/**
	 * 이메일 정규식 체크
	 * @param newId
	 * @return
	 */
	public static boolean isEmail(String str) {
		if(str == null)return false;
		boolean chk = false;

		Matcher match = Pattern.compile(PATTERNEMAIL).matcher(str);
		if (match.find()) {
			chk = true;
		}
		return chk;
	}
	/**
	 * 아이디 정규식 체크
	 * @param newId
	 * @return
	 */
	public static boolean idRegularExpressionChk(String newId) {
		if(newId == null)return false;
		boolean chk = false;
		Matcher match = Pattern.compile(PATTERNID).matcher(newId);
		if (match.find()) {
			chk = true;
		}
		return chk;
	}
	/**
	 * 비밀번호 정규식 체크
	 * 
	 * @param pwd
	 * @return
	 */
	public static boolean pwdRegularExpressionChk(String newPwd) {
		if(newPwd == null)return false;
		boolean chk = false;

		/* 특수문자, 영문, 숫자 조합 (6~20 자리)
		Matcher match = Pattern.compile(PATTERN1).matcher(newPwd);
		if (match.find()) {
			chk = true;
		}
		*/
		
		//영문, 숫자 (10~20 자리)
		Matcher match = Pattern.compile(PATTERN2).matcher(newPwd);
		if (match.find()) {
			chk = true;
		}

		/*
		// 영문, 특수문자 (10~20 자리)
		match = Pattern.compile(PATTERN3).matcher(newPwd);
		if (match.find()) {
			chk = true;
		}

		// 특수문자, 숫자 (10~20 자리)
		match = Pattern.compile(PATTERN4).matcher(newPwd);
		if (match.find()) {
			chk = true;
		}

		if (chk) {
			// 연속문자 4자리
			if (samePwd(newPwd)) {
				return false;
			}

			// 같은문자 4자리
			if (continuousPwd(newPwd)) {
				return false;
			}
		}
*/
		return chk;
	}

	/**
	 * 같은 문자, 숫자 4자리 체크
	 * 
	 * @param pwd
	 * @return
	 */
	public static boolean samePwd(String pwd) {
		if(pwd == null)return false;
		Matcher match = Pattern.compile(PATTERN5).matcher(pwd);

		return match.find() ? true : false;
	}

	/**
	 * 연속 문자, 숫자 4자리 체크
	 * 
	 * @param pwd
	 * @return
	 */
	public static boolean continuousPwd(String pwd) {
		if(pwd == null)return false;
		int o = 0;
		int d = 0;
		int p = 0;
		int n = 0;
		int limit = 4;

		for (int i = 0; i < pwd.length(); i++) {
			char tempVal = pwd.charAt(i);
			if (i > 0 && (p = o - tempVal) > -2
					&& (n = p == d ? n + 1 : 0) > limit - 3) {
				return true;
			}
			d = p;
			o = tempVal;
		}

		return false;
	}

	/**
	 * 아이디와 동일 문자 4자리 체크
	 * 
	 * @param pwd
	 * @param id
	 * @return
	 */
	public static boolean sameId(String pwd, String id) {
		if(pwd == null || id == null)return false;
		for (int i = 0; i < pwd.length() - 3; i++) {
			if (id.contains(pwd.substring(i, i + 4))) {
				return true;
			}
		}

		return false;
	}
}