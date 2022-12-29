package kr.co.xicom.cms.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.cms.model.BbsVO;

@Service
public interface BbsService {

	int add(BbsVO vo) throws Exception;

	Map<String, Object> list(BbsVO vo) throws Exception;

	BbsVO getView(BbsVO vo) throws Exception;

	int update(BbsVO vo, String string) throws Exception;

	EgovMap getUC(BbsVO vo) throws Exception;

	//List<BbsVO> getAuth(BbsVO vo) throws Exception;

	List<EgovMap> getAuthList(BbsVO vo) throws Exception;
	
	
	
}