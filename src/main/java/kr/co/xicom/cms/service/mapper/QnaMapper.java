package kr.co.xicom.cms.service.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.BbsQnaVO;

@Mapper("QnaMapper")
public interface QnaMapper {

	List<BbsQnaVO> list(BbsQnaVO vo) throws Exception;

	int listCnt(BbsQnaVO vo) throws Exception;

	BbsQnaVO getBbsQnabyId(BbsQnaVO bbsQnaVO) throws Exception;

	int updateBbsQna(BbsQnaVO bbsQnaVO) throws Exception;

}
