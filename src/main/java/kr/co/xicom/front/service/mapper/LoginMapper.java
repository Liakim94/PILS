package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.CmpMemberVo;

@Mapper("LoginMapper")
public interface LoginMapper {
    int memberLogin(CmpMemberVo memberVo) throws Exception;

}
