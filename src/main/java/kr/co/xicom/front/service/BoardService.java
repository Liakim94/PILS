package kr.co.xicom.front.service;

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
}