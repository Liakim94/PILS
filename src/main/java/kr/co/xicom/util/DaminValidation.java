package kr.co.xicom.util;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.json.simple.JSONObject;

public class DaminValidation {
	
	public static boolean validToken(String check, String userkey) {

		boolean isValidToken = false;	
		//날짜 검증	
		try {
			//userkey 검증
			if(check.substring(0,check.length()-10).equals(userkey)) {
				isValidToken =  true;
			}
			else {
				isValidToken = false;
			}
			//날짜검증
			if(isValidToken) {
			SimpleDateFormat dformat = new SimpleDateFormat("yyyyMMddHH");
			dformat.setLenient(false);
			dformat.parse(check.substring(userkey.length()));
			isValidToken = true;
			}
		}
		catch(ParseException e) {
			isValidToken = false;
		}
		return isValidToken;
	}
}