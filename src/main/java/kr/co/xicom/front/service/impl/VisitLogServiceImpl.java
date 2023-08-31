package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.VisitLogVO;
import kr.co.xicom.front.service.VisitLogService;
import kr.co.xicom.front.service.mapper.VisitLogMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class VisitLogServiceImpl implements VisitLogService {

	private static final Logger LOGGER = LoggerFactory.getLogger(VisitLogServiceImpl.class);

	@Resource
	private VisitLogMapper visitLogMapper;

	@Override
	public void log(String ip, String url, String referer, String userAgent) throws Exception {

		LOGGER.debug("---->> ip : " + ip);
		LOGGER.debug("---->> referer : " + referer);
		LOGGER.debug("---->> user agent : " + userAgent);
		LOGGER.debug("---->> url : " + url);

		VisitLogVO visitLogVO = VisitLogVO.builder()
				.ip(ip)
				.url(url)
				.referer(referer)
				.userAgent(userAgent)
				.build();
		visitLogMapper.create(visitLogVO);
	}
}
