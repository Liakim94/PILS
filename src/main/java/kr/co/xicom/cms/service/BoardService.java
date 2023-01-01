package kr.co.xicom.cms.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.cmmn.model.AttachVO;
import kr.co.xicom.cms.model.BbsVO;
import kr.co.xicom.cms.model.BoardVO;

@Service
public interface BoardService {

	int add(BoardVO boardVO, AttachVO attchVO) throws Exception;

	Map<String, Object> list(BoardVO boardVO) throws Exception;

	BoardVO getView(BoardVO boardVO) throws Exception;

	int update(BoardVO boardVO, AttachVO attachVO, String string) throws Exception;

	void read(BoardVO boardVO) throws Exception;

	int updateStat(BoardVO boardVO) throws Exception;

    String getMenu(int bbsId) throws Exception;
}