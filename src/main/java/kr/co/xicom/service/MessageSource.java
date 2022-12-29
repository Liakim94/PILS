package kr.co.xicom.service;

import java.util.Locale;
import org.springframework.context.support.MessageSourceAccessor;

import kr.co.xicom.util.NullUtil;

public class MessageSource {

    private static MessageSourceAccessor msgSA = null;
    public MessageSource() {
        // TODO Auto-generated constructor stub
    }
    
    public void setMessageSourceAccessor(MessageSourceAccessor msgSA) {
        MessageSource.msgSA = msgSA;
    }
    
    public static String getMessage(String key) {
        return msgSA.getMessage(NullUtil.nullString(key), Locale.getDefault());
    }
    
    public static String getMessage(String key, Object[] obj) {
        if(obj != null) {
            return msgSA.getMessage(NullUtil.nullString(key), obj, Locale.getDefault());
        }else {
            return msgSA.getMessage(NullUtil.nullString(key), Locale.getDefault());
        }
    }
    
}
