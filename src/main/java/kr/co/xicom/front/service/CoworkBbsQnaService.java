package kr.co.xicom.front.service;

import kr.co.xicom.front.model.BbsQnaVO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface CoworkBbsQnaService {

	Map<String, Object> list(BbsQnaVO vo)throws Exception;

	int insertBbsQna(BbsQnaVO vo)throws Exception;

	int chkPasswd(BbsQnaVO vo)throws Exception;

	BbsQnaVO getBbsQnabyId(BbsQnaVO bbsQnaVO)throws Exception;

	int repostBbsQna(BbsQnaVO vo)throws Exception;

}
