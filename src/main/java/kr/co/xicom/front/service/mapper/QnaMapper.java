package kr.co.xicom.front.service.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.QnaVO;

@Mapper("QnaMapper")
public interface QnaMapper {

	List<QnaVO> list(QnaVO vo)throws Exception;

	int listCnt(QnaVO vo)throws Exception;

	int insertBbsQna(QnaVO vo)throws Exception;

	int chkPasswd( QnaVO vo)throws Exception;

	QnaVO getBbsQnabyId(QnaVO qnaVO)throws Exception;

	int repostBbsQna(QnaVO vo)throws Exception;

	int qnaDelete(int no) throws Exception;

}
