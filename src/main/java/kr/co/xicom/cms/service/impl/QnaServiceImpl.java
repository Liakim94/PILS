package kr.co.xicom.cms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.xicom.cms.service.QnaService;
import kr.co.xicom.cms.service.mapper.QnaMapper;
import kr.co.xicom.front.model.BbsQnaVO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaMapper qnaMapper;

	@Override
	public Map<String, Object> list(BbsQnaVO vo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BbsQnaVO> list = null;
		int cnt = 0;
		
		list = qnaMapper.list(vo);
		cnt = qnaMapper.listCnt(vo);
		
		map.put("resultList",list);
		map.put("resultCnt", cnt);
		
		return map;
	}

	@Override
	public BbsQnaVO getBbsQnabyId(BbsQnaVO bbsQnaVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.getBbsQnabyId(bbsQnaVO);
	}

	@Override
	public int updateBbsQna(BbsQnaVO bbsQnaVO) throws Exception {
		// TODO Auto-generated method stub
		return qnaMapper.updateBbsQna(bbsQnaVO);
	}
	

}
