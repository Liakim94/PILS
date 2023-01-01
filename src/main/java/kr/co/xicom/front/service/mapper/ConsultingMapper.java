package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.CmpMemberVo;

import java.util.List;


@Mapper("ConsultingMapper")
public interface ConsultingMapper {
    int insertConsulting(CmpMemberVo vo) throws Exception;

    int insertMemberInfo(CmpMemberVo vo) throws Exception;

    List<CmpMemberVo> list(CmpMemberVo vo) throws Exception;

    int listCount(CmpMemberVo vo) throws Exception;

    int conChkPw(CmpMemberVo vo) throws Exception;
}
