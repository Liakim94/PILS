package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.BannerVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.PerformanceVO;

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

    List<BannerVO> bannerAll(BannerVO vo) throws Exception;
    //동행기업 실적 제출하기
    int perfApply(PerformanceVO vo) throws Exception;
    List<PerformanceVO> perfList(String id) throws Exception;
    int perfCount(String id) throws Exception;
    PerformanceVO perfView(PerformanceVO vo) throws Exception;

    int perfDelete(int seq) throws Exception;
    int perfEdit(PerformanceVO vo) throws Exception;
}
