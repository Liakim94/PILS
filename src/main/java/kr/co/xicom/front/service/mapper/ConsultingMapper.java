package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CmpSttusVO;
import kr.co.xicom.front.model.ConsultingVO;
import kr.co.xicom.front.model.PerformanceVO;

import java.util.List;


@Mapper("ConsultingMapper")
public interface ConsultingMapper {
    int insertConsulting(ConsultingVO vo) throws Exception;
    ConsultingVO viewConsulting(ConsultingVO vo) throws Exception;
    int consultEdit(ConsultingVO vo) throws Exception;
    int consultDelete(ConsultingVO vo) throws Exception;

    List<ConsultingVO> consultList(ConsultingVO vo) throws Exception;
    List<CmpMemberVo> list(CmpMemberVo vo) throws Exception;
    int consultListCount(ConsultingVO vo) throws Exception;
    int mainCount(CmpMemberVo vo) throws Exception;
    int listCount(ConsultingVO vo) throws Exception;
    int joinCmp(CmpMemberVo vo) throws Exception;

    int conChkPw(CmpMemberVo vo) throws Exception;

    CmpMemberVo getViewByBizNo(CmpMemberVo vo) throws Exception;
    CmpMemberVo getViewById(CmpMemberVo vo) throws Exception;

    int update(CmpMemberVo vo) throws Exception;
    int memUpdate(CmpMemberVo vo) throws Exception;

    Integer consultCheck(ConsultingVO vo) throws Exception;

    //동행기업 신청
    int insertJoin(CmpMemberVo vo) throws Exception;
    int insertMemberJoin(CmpMemberVo vo) throws Exception;
    String checkId(String id) throws Exception;
    String checkBizno(String bizNo) throws Exception;

    //동행기업 수정
    int updateJoin(CmpMemberVo vo) throws Exception;
    int updateCmpSttus (CmpSttusVO vo) throws Exception;

    //기업현황
    List<CmpSttusVO> getCmpSttus(CmpSttusVO vo) throws Exception;
    List<CmpSttusVO> sttusIsEmpty(CmpSttusVO vo) throws Exception;
    int insertCmpSttus(CmpSttusVO vo) throws Exception;


}
