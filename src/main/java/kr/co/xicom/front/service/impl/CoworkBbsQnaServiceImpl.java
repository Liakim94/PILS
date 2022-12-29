package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.BbsQnaVO;
import kr.co.xicom.front.service.CoworkBbsQnaService;
import kr.co.xicom.front.service.mapper.CoworkBbsQnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CoworkBbsQnaServiceImpl implements CoworkBbsQnaService {

	@Autowired
	private CoworkBbsQnaMapper mapper;

	@Override
	public Map<String, Object> list(BbsQnaVO vo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<BbsQnaVO> list = null;
		int cnt = 0;
		
		list = mapper.list(vo);
		cnt = mapper.listCnt(vo);
		
		map.put("resultList",list);
		map.put("resultCnt", cnt);
		
		return map;
	}

	@Override
	public int insertBbsQna(BbsQnaVO vo) throws Exception {
		return mapper.insertBbsQna(vo);
	}

	@Override
	public int chkPasswd(BbsQnaVO vo) throws Exception {
		return mapper.chkPasswd(vo);
	}

	@Override
	public BbsQnaVO getBbsQnabyId(BbsQnaVO bbsQnaVO) throws Exception {
		return mapper.getBbsQnabyId(bbsQnaVO);
	}

	@Override
	public int updateBbsQna(BbsQnaVO vo) throws Exception {
		return mapper.updateBbsQna(vo);
	}

}
