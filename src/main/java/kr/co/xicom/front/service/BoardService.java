package kr.co.xicom.front.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BoardVO;

@Service
public interface BoardService {

	int add(BoardVO boardVO, AttachVO attchVO) throws Exception;

	Map<String, Object> list(BoardVO boardVO) throws Exception;

	BoardVO getView(BoardVO boardVO) throws Exception;

	int update(BoardVO boardVO, AttachVO attachVO, String string) throws Exception;

	void read(BoardVO boardVO) throws Exception;

	int updateStat(BoardVO boardVO) throws Exception;

    String getMenu(int bbsId) throws Exception;

	// WildRain 추가 2023-01-13
	/** 게시글 첨부파일 리스트 추출 */
	List<AttachVO> getAttachList(BoardVO boardVO) throws Exception;

    //Do 추가 2023-02-01
    //걸어온 발자취 list
    Map<String, Object> readyList(BoardVO vo) throws Exception;
}