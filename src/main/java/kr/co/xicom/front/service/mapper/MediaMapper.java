package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.MediaVO;


import java.util.List;

@Mapper("MediaMapper")
public interface MediaMapper {

	int addMedia(AttachVO vo) throws Exception;

	List<EgovMap> getMediaList(MediaVO vo) throws Exception;

	int pageCount(MediaVO mediaVO) throws Exception;

//	List<ContVO> listPage(MediaVO mediaVO) throws Exception;

	EgovMap getUC() throws Exception;

	int statChange(MediaVO mediaVO) throws Exception;

	MediaVO getMedia(MediaVO mediaVO) throws Exception;

	int edit(MediaVO mediaVO) throws Exception;

	void updateMediaUpload(MediaVO vo)throws Exception;

}
