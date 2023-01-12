package kr.co.xicom.front.service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.MediaVO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface MediaService {

	int add(AttachVO vo) throws Exception;

//	Map<String, Object> list(MediaVO mediaVO) throws Exception;		//콘텐츠관리 - 미디어 리스트
	
	int pageCount(MediaVO mediaVO) throws Exception;				//콘텐츠관리 - 미디어 리스트 카운트

	EgovMap getUC() throws Exception;								//콘텐트관리 - 미디어 좌측상태 카운트

	int statChange(MediaVO mediaVO) throws Exception;				//콘텐츠관리 - 미디어 상태값 변경

	MediaVO getMedia(MediaVO mediaVO) throws Exception;				//콘텐츠관리 - 미디어 수정창 리스트

	int edit(MediaVO mediaVO) throws Exception;						//콘텐츠관리 - 미디어 수정

	void updateMediaUpload(MediaVO vo)throws Exception; //콘텐츠관리 - 미디어 site 아이디등록
	
}