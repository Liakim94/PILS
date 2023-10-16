package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.ContactVO;
import kr.co.xicom.front.model.QnaVO;
import kr.co.xicom.front.service.QnaService;
import kr.co.xicom.front.service.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper mapper;

	@Override
	public List<ContactVO> contact(ContactVO vo) throws Exception {
		return mapper.contact(vo);
	}

	@Override
	public Map<String, Object> list(QnaVO vo) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<QnaVO> list = null;
		int cnt = 0;
		
		list = mapper.list(vo);
		cnt = mapper.listCnt(vo);
		
		map.put("resultList",list);
		map.put("resultCnt", cnt);
		
		return map;
	}

	@Override
	public int insertBbsQna(QnaVO vo) throws Exception {
		return mapper.insertBbsQna(vo);
	}

	@Override
	public int chkPasswd(QnaVO vo) throws Exception {
		return mapper.chkPasswd(vo);
	}

	@Override
	public QnaVO getBbsQnabyId(QnaVO qnaVO) throws Exception {
		return mapper.getBbsQnabyId(qnaVO);
	}

	@Override
	public int repostBbsQna(QnaVO vo) throws Exception {
		return mapper.repostBbsQna(vo);
	}

	@Override
	public int qnaDelete(int no) throws Exception{
		return mapper.qnaDelete(no);
	}


}
