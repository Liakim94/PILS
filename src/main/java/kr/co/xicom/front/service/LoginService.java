package kr.co.xicom.front.service;

import kr.co.xicom.front.model.CmpMemberVo;
import org.springframework.stereotype.Service;

@Service
public interface LoginService {
    int memberLogin(CmpMemberVo memberVo) throws Exception;
}
