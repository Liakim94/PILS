package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.RcmdVO;

@Mapper("RcmdMapper")
public interface RcmdMapper {
    int insertRcmd(RcmdVO vo) throws Exception;

}
