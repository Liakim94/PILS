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

    CmpMemberVo getViewByBizNo(CmpMemberVo vo) throws Exception;

    int update(CmpMemberVo vo) throws Exception;
    int memUpdate(CmpMemberVo vo) throws Exception;

    //동행기업 신청
    int insertJoin(CmpMemberVo vo) throws Exception;
    int insertMemberJoin(CmpMemberVo vo) throws Exception;
    //동행기업 수정
    int updateMemJoin(CmpMemberVo vo) throws Exception;
    int updateJoin(CmpMemberVo vo) throws Exception;
}