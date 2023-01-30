package kr.co.xicom.front.service;

import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface AdminService {
    //동행기업 list
    Map<String, Object> joinList(CmpMemberVo vo)  throws Exception;

    //관리자페이지
    List<CmpMemberVo> memManageList(CmpMemberVo vo) throws Exception;

    //걸어온 발자취 관리
    int tracePost(TraceVO vo) throws Exception;

    Map<String, Object> traceList(TraceVO vo) throws Exception;

    TraceVO traceView(int seq) throws Exception;

    int traceUpdate(TraceVO vo)  throws Exception;

    int traceDelete(int seq) throws Exception;

    int readyPost(BoardVO vo) throws Exception;

    int updatePost(BoardVO vo) throws Exception;
}
