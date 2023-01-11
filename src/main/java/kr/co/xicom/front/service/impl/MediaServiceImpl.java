package kr.co.xicom.front.service.impl;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.MediaVO;
import kr.co.xicom.front.service.MediaService;
import kr.co.xicom.front.service.mapper.MediaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class MediaServiceImpl implements MediaService {

	@Autowired
	private MediaMapper mediaMapper;

	@Override
	public int add(AttachVO vo) throws Exception {
		return mediaMapper.addMedia(vo);
	}
	
//	//페이지관리 - 미디어 리스트
//	@Override
//	public Map<String, Object> list(MediaVO mediaVO) throws Exception {
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		List<ContVO> list = null;
//		int cnt = 0;
//
//		//페이지관리 리스트
//		list = mediaMapper.listPage(mediaVO);
//
//		map.put("resultList", list);
//		map.put("resultCnt", cnt);
//
//		return map;
//	}
//
	//페이지관리 - 미디어 리스트 카운트
	@Override
	public int pageCount(MediaVO mediaVO) throws Exception {
		return mediaMapper.pageCount(mediaVO);
	}

	
	//페이지관리 - 좌측 카운트
	@Override
	public EgovMap getUC() throws Exception {
		return mediaMapper.getUC();
	}

	//페이지관리 - 상태값 변경
	@Override
	public int statChange(MediaVO mediaVO) throws Exception {
		return mediaMapper.statChange(mediaVO);
	}
	
	//페이지관리 - 수정창 데이터 조회
	@Override
	public MediaVO getMedia(MediaVO mediaVO) throws Exception {
		return mediaMapper.getMedia(mediaVO);
	}

	
	//페이지관리 - 미디어 수정
	@Override
	public int edit(MediaVO mediaVO) throws Exception {
		return mediaMapper.edit(mediaVO);
	}

	@Override
	public void updateMediaUpload(MediaVO vo) throws Exception {
		// TODO Auto-generated method stub
		mediaMapper.updateMediaUpload(vo);
	}
}
