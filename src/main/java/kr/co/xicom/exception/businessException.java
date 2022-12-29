package kr.co.xicom.exception;

/**
 * 2021-02-01 Exception 추가
 */
public class businessException extends Exception {
    private static final long serialVersionUID = 1L;

    public businessException() {}

    public businessException(String message) {
        super(message);
    }
}
