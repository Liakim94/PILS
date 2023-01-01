package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.mapper.ConsultingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConsultingServiceImpl implements ConsultingService {
    @Autowired
    private ConsultingMapper mapper;

    @Override
    public int insertConsulting(CmpMemberVo vo) throws Exception {
        return mapper.insertConsulting(vo);
    }

    @Override
    public int insertMemberInfo(CmpMemberVo vo) throws Exception {
        return mapper.insertMemberInfo(vo);
    }
}
