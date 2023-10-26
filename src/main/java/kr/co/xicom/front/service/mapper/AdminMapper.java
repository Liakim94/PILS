package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper("AdminMapper")
public interface AdminMapper {

    List<CmpMemberVo>joinList(CmpMemberVo vo)  throws Exception;
    CmpMemberVo memInfo(CmpMemberVo vo) throws Exception;
    int deleteCmp(String bizNo) throws Exception;
    int listCount(CmpMemberVo vo) throws Exception;
    List<CmpMemberVo> memManageList(CmpMemberVo vo)  throws Exception;
    int memManageListCount(CmpMemberVo vo) throws Exception;
    CmpMemberVo memEdit(CmpMemberVo vo) throws Exception;
    int updateMem(CmpMemberVo vo) throws Exception;
    int approveMem(CmpMemberVo vo) throws Exception;
    int deleteMem(@Param("bizNo")String bizNo, @Param("id")String id) throws Exception;
    int changePw(CmpMemberVo vo) throws Exception;

    int tracePost(TraceVO vo) throws Exception;
    List<TraceVO> traceList(TraceVO vo) throws Exception;
    TraceVO traceView(int seq) throws Exception;
    int traceCount(TraceVO vo) throws Exception;
    int traceDelete(int seq) throws Exception;
    int traceUpdate(TraceVO vo) throws Exception;

    List<RcmdVO>recomList(RcmdVO vo) throws Exception;
    int recomCount(RcmdVO vo) throws Exception;

    List<BannerVO> banList(BannerVO vo) throws Exception;
    int banCount(BannerVO vo) throws Exception;

    int banPost(BannerVO vo) throws Exception;
    BannerVO bannerView(BannerVO vo) throws Exception;
    int bannerEdit(BannerVO vo) throws Exception;

    int bannerDelete(BannerVO vo) throws Exception;

    int contactCount(ContactVO vo) throws Exception;

    List<ContactVO> contact(ContactVO vo)throws Exception;

    ContactVO conView(ContactVO vo)throws Exception;
    int conPost(ContactVO vo)throws Exception;
    int conEdit(ContactVO vo)throws Exception;

    int conDelete(ContactVO vo) throws Exception;

    List<PerformanceVO> perfListSort(PerformanceVO vo) throws Exception;
    int perfCount(PerformanceVO vo) throws Exception;
    PerformanceVO perfView(PerformanceVO vo) throws Exception;
    int perfDelete(int seq) throws Exception;
    int perfEdit(PerformanceVO vo) throws Exception;

}
