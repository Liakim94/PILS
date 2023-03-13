package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.RcmdVO;

import java.util.List;

@Mapper("RcmdMapper")
public interface RcmdMapper {
    int insertRcmd(RcmdVO vo) throws Exception;
    RcmdVO rcmdView(int no) throws Exception;

}
