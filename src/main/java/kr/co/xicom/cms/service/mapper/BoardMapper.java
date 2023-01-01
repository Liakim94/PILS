package kr.co.xicom.cms.service.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.cms.model.BoardVO;

@Mapper("BoardMapper")
public interface BoardMapper {

	int addBoard(BoardVO vo) throws Exception;

	List<BoardVO> listBoard(BoardVO vo) throws Exception;

	int boardCount(BoardVO vo) throws Exception;

	void updateRef(BoardVO vo) throws Exception;

	void updateStep(BoardVO vo) throws Exception;

	void updateLevel(BoardVO vo) throws Exception;

	int updateBoard(BoardVO vo) throws Exception;

	BoardVO getBoard(BoardVO vo) throws Exception;

	void readBoard(BoardVO vo) throws Exception;

	int updateStat(BoardVO vo) throws Exception;

	String getMenu(int bbsId) throws Exception;

}
