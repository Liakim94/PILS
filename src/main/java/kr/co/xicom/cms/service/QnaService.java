package kr.co.xicom.cms.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.xicom.front.model.BbsQnaVO;

@Service
public interface QnaService {

	Map<String, Object> list(BbsQnaVO bbsQnaVO) throws Exception;

	BbsQnaVO getBbsQnabyId(BbsQnaVO bbsQnaVO) throws Exception;

	int updateBbsQna(BbsQnaVO bbsQnaVO) throws Exception;

}
