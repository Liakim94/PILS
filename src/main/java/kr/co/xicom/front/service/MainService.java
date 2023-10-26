package kr.co.xicom.front.service;

import kr.co.xicom.front.model.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface MainService {
    int memberLogin(CmpMemberVo memberVo) throws Exception;
    String memberBizno(String id) throws Exception;

    String memAuthCd(String id) throws Exception;

    List<CmpMemberVo> memManage(CmpMemberVo vo) throws Exception;

    int memAdd(CmpMemberVo vo) throws Exception;

    CmpMemberVo getMemInfo(CmpMemberVo vo) throws Exception;

    CmpMemberVo memEdit(CmpMemberVo vo) throws Exception;

    int updateMem(CmpMemberVo vo) throws Exception;

    int changePw(CmpMemberVo vo) throws Exception;


    List<BannerVO> bannerAll(BannerVO vo) throws Exception;

    int mbrApply(CmpMemberVo vo) throws Exception;

    CmpMemberVo getViewById(CmpMemberVo vo) throws Exception;

    //동행기업 실적 제출하기
    Map<String, Object> perfList(String id) throws Exception;

    int perfApply(PerformanceVO vo) throws Exception;

    PerformanceVO perfView(PerformanceVO vo) throws Exception;

    int perfDelete(int seq) throws Exception;
    int perfEdit(PerformanceVO vo) throws Exception;
}
