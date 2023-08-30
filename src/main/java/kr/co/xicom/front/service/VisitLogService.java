package kr.co.xicom.front.service;

import kr.co.xicom.front.model.QnaVO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface VisitLogService {

	void log(String ip, String url, String referer, String userAgent) throws Exception;
}

