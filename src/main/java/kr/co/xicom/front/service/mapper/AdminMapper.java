package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.BannerVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.RcmdVO;
import kr.co.xicom.front.model.TraceVO;
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
    BannerVO bannerView(int banSeq) throws Exception;

    int bannerDelete(BannerVO vo) throws Exception;

}
