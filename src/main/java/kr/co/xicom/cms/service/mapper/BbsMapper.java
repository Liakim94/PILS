package kr.co.xicom.cms.service.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.cms.model.BbsVO;


@Mapper("BbsMapper")
public interface BbsMapper {

	int addBbs(BbsVO vo) throws Exception;

	List<BbsVO> listBbs(BbsVO vo) throws Exception;

	int bbsCount(BbsVO vo) throws Exception;

	BbsVO getBbs(BbsVO vo) throws Exception;
	
	int updateBbs(BbsVO vo) throws Exception;

	int updateStat(BbsVO vo) throws Exception;

	int addAuth(BbsVO vo) throws Exception;

	void addAuth(Map<String, Object> map) throws Exception;

	List<EgovMap> getAuthList(BbsVO vo) throws Exception;

}
