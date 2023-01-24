package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

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
    public List<TraceVO> traceList(TraceVO vo) throws Exception{
        return adminMapper.traceList(vo);
    }
    @Override
    public TraceVO traceView(int seq) throws Exception{
        return adminMapper.traceView(seq);
    }

}
