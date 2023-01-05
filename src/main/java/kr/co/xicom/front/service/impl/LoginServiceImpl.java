package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.LoginService;
import kr.co.xicom.front.service.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper mapper;

    @Override
    public int memberLogin(CmpMemberVo memberVo) throws Exception {
        int result =0;
        try{
           result = mapper.memberLogin(memberVo);
            if( result >0){
                return 1;
            }
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return result;
    }


}
