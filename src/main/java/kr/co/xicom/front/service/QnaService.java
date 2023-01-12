package kr.co.xicom.front.service;

import kr.co.xicom.front.model.QnaVO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface QnaService {

	Map<String, Object> list(QnaVO vo)throws Exception;

	int insertBbsQna(QnaVO vo)throws Exception;

	int chkPasswd(QnaVO vo)throws Exception;

	QnaVO getBbsQnabyId(QnaVO qnaVO)throws Exception;

	int repostBbsQna(QnaVO vo)throws Exception;

	int qnaDelete(int no) throws Exception;
}
