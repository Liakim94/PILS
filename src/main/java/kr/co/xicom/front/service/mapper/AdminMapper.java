package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;

import java.util.List;

@Mapper("AdminMapper")
public interface AdminMapper {

    List<CmpMemberVo>joinList(CmpMemberVo vo)  throws Exception;
    int listCount(CmpMemberVo vo) throws Exception;
    List<CmpMemberVo> memManageList(CmpMemberVo vo)  throws Exception;
    int tracePost(TraceVO vo) throws Exception;
    List<TraceVO> traceList(TraceVO vo) throws Exception;
    TraceVO traceView(int seq) throws Exception;
    int traceCount(TraceVO vo) throws Exception;
    int traceDelete(int seq) throws Exception;
    int traceUpdate(TraceVO vo) throws Exception;
}
