package kr.co.xicom.cms.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.xicom.cms.model.CommentVO;
import kr.co.xicom.cms.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	@Override
	public int add(CommentVO vo) throws Exception {
		return 0;
	}

	@Override
	public List<Object> list(CommentVO vo) throws Exception {
		return null;
	}
	
	@Override
	public int update(CommentVO vo, String cmd) throws Exception {
		return 0;
	}
	
}
