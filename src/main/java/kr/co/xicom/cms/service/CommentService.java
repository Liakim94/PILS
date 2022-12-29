package kr.co.xicom.cms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.xicom.cms.model.CommentVO;

@Service
public interface CommentService {

	int add(CommentVO cmtVO) throws Exception;

	List<Object> list(CommentVO cmtVO) throws Exception;

	int update(CommentVO cmtVO, String string) throws Exception;
	
	
	
}