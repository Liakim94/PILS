package kr.co.xicom.front.service;

import kr.co.xicom.front.model.CmpMemberVo;
import org.springframework.stereotype.Service;

@Service
public interface ConsultingService {

    int insertConsulting(CmpMemberVo vo) throws Exception;
    int insertMemberInfo(CmpMemberVo vo) throws Exception;
}
