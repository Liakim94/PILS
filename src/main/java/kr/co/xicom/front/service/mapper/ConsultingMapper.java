package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.CmpMemberVo;


@Mapper("ConsultingMapper")
public interface ConsultingMapper {
    int insertConsulting(CmpMemberVo vo) throws Exception;

    int insertMemberInfo(CmpMemberVo vo) throws Exception;
}
