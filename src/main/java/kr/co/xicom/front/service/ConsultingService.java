package kr.co.xicom.front.service;

import kr.co.xicom.front.model.BbsQnaVO;
import kr.co.xicom.front.model.CmpMemberVo;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface ConsultingService {

    int insertConsulting(CmpMemberVo vo) throws Exception;
    Map<String, Object> list(CmpMemberVo vo) throws Exception;
    int conChkPw(CmpMemberVo vo) throws Exception;
}
