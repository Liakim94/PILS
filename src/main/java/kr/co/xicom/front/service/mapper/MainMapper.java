package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.CmpMemberVo;

import java.util.List;

@Mapper("MainMapper")
public interface MainMapper {
    int memberLogin(CmpMemberVo memberVo) throws Exception;
    String memberBizno(String id) throws Exception;
    String memAuthCd(String id) throws Exception;
    List<CmpMemberVo>memManage(CmpMemberVo vo)  throws Exception;
    int memAdd(CmpMemberVo vo) throws Exception;
    CmpMemberVo getMemInfo(CmpMemberVo vo) throws Exception;
    CmpMemberVo memEdit(CmpMemberVo vo) throws Exception;
    int updateMem(CmpMemberVo vo) throws Exception;
    int changePw(CmpMemberVo vo) throws Exception;

}
