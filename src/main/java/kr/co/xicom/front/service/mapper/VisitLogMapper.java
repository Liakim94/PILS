package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.VisitLogVO;

@Mapper("VisitLogMapper")
public interface VisitLogMapper {

	void create(VisitLogVO visitLogVO) throws Exception;

}
