package kr.co.xicom.front.service;

import kr.co.xicom.front.model.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface ConsultingService {

    int insertConsulting(CmpMemberVo vo,CmpSttusVO stVO) throws Exception;
    Map<String, Object> list(CmpMemberVo vo) throws Exception;
    int conChkPw(CmpMemberVo vo) throws Exception;
    CmpMemberVo getViewByBizNo(CmpMemberVo vo) throws Exception;
    int update(CmpMemberVo vo,CmpSttusVO stVO) throws Exception;
    int conCheck(CmpMemberVo vo) throws Exception;



    //동행기업 신청
//    int insertJoinApply(CmpMemberVo vo, CmpSttusVO stVO, AttachVO attachVO) throws Exception;
    int insertJoinApply(CmpMemberVo vo, AttachVO attachVO) throws Exception;

    int checkBizno(String bizNo) throws Exception;

    int checkId(String id) throws Exception;
    //동행기업 수정
//    int updateJoin(CmpMemberVo vo, CmpSttusVO stVO, AttachVO attachVO) throws Exception;
    int updateJoin(CmpMemberVo vo, AttachVO attachVO) throws Exception;

    //기업현황
    List<CmpSttusVO>  getCmpSttus(CmpSttusVO vo) throws Exception;

    // 동행기업 첨부서류 리스트 추출
    List<AttachVO> getAttachList(CmpMemberVo vo) throws Exception;

    //동행기업 참여 추천
    int insertRecom(RcmdVO vo) throws Exception;

    RcmdVO rcmdView(int no) throws Exception;
}
