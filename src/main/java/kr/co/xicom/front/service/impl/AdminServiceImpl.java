package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.mapper.AdminMapper;
import kr.co.xicom.front.service.mapper.BoardMapper;
import org.apache.commons.collections.functors.ExceptionPredicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private BoardMapper boardMapper;

    //담당자 관리
    @Override
    public List<CmpMemberVo> memManageList(CmpMemberVo vo) throws Exception{
        return adminMapper.memManageList(vo);
    }
    //걸어온 발자취 관리
    @Override
    public int tracePost(TraceVO vo) throws Exception{
        return adminMapper.tracePost(vo);
    }
    @Override
    public Map<String, Object> traceList(TraceVO vo) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();

        int cnt = adminMapper.traceCount(vo);
        List<TraceVO> list= adminMapper.traceList(vo);

        map.put("resultList", list);
        map.put("resultCnt", cnt);
        return map;
    }
    @Override
    public TraceVO traceView(int seq) throws Exception{
        return adminMapper.traceView(seq);
    }
    @Override
    public int traceUpdate(TraceVO vo)  throws Exception{
        return adminMapper.traceUpdate(vo);
    }
    @Override
    public int traceDelete(int seq) throws Exception{
        return adminMapper.traceDelete(seq);
    }
    @Override
    public int readyPost(BoardVO vo) throws Exception{
        return boardMapper.addBoard(vo);
    }
    @Override
    public int updatePost(BoardVO vo) throws Exception{
        return boardMapper.updateBoard(vo);
    }

}
