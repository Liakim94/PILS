package kr.co.xicom.util;

import java.security.MessageDigest;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.log4j.Logger;

import kr.co.xicom.exception.businessException;

public class SecurityUtil {
    protected final Logger logger = Logger.getLogger(SecurityUtil.class);
	public String encryptSHA256(String str) {
		
		String sha = "";
		
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			
			for(int i=0; i<byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]&0xff)+0x100, 16).substring(1));
			}
			
			sha = sb.toString();
		} catch(Exception e) {
			logger.error("ENCRYPT ERROR");
			sha = null;
		}
		
		return sha;
	}
	
	//비밀번호 암호화
	public static String EncryptAES(String strPlainText) throws businessException{
		try{
			Cipher cipher = Cipher.getInstance("RSA/CBC/PKCS5Padding");
			SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
			cipher.init(Cipher.ENCRYPT_MODE, getSecretKey(), sr);

			byte[] encrypted = cipher.doFinal( strPlainText.getBytes() );
			return asHex(encrypted);
		}catch(Exception e){
			throw new businessException("ERROR");
		}
	}

	public static SecretKeySpec getSecretKey(){
		byte [] key = new byte[16];
		key[0] = 0x21;
		key[1] = 0x4C;
		key[2] = 0x47;
		key[3] = 0x57;
		key[4] = 0x6F;
		key[5] = 0x72;
		key[6] = 0x6C;
		key[7] = 0x64;
		key[8] = 0x42;
		key[9] = 0x69;
		key[10] = 0x6C;
		key[11] = 0x6C;
		key[12] = 0x69;
		key[13] = 0x6E;
		key[14] = 0x67;
		key[15] = 0x24;

		return new SecretKeySpec(key, "AES");
	}

	public static String asHex(byte buf[]){
		StringBuffer strbuf = new StringBuffer(buf.length * 2);
		int i;

		for (i = 0; i < buf.length; i++) {
			if ((buf[i] & 0xff) < 0x10)
				strbuf.append("0");

			strbuf.append(Long.toString(buf[i] & 0xff, 16));
		}

		return strbuf.toString();
	}
}
