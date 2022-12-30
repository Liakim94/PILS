package kr.co.xicom.front.service.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.BbsQnaVO;
import org.springframework.data.repository.query.Param;

@Mapper("CoworkBbsQnaMapper")
public interface CoworkBbsQnaMapper {

	List<BbsQnaVO> list(BbsQnaVO vo)throws Exception;

	int listCnt(BbsQnaVO vo)throws Exception;

	int insertBbsQna(BbsQnaVO vo)throws Exception;

	int chkPasswd( BbsQnaVO vo)throws Exception;

	BbsQnaVO getBbsQnabyId(BbsQnaVO bbsQnaVO)throws Exception;

	int repostBbsQna(BbsQnaVO vo)throws Exception;

}
