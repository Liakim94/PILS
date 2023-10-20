package kr.co.xicom.front.service;

import kr.co.xicom.front.model.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface AdminService {
    //동행기업 list
    Map<String, Object> joinList(CmpMemberVo vo)  throws Exception;

    CmpMemberVo memInfo(CmpMemberVo vo) throws Exception;

    //동행기업 삭제하기
    int deleteCmp(String bizNo) throws Exception;

    //컨설팅 list
    Map<String, Object> conList(CmpMemberVo vo) throws Exception;

    //관리자페이지
    Map<String, Object> memManageList(CmpMemberVo vo) throws Exception;

    CmpMemberVo memEdit(CmpMemberVo vo) throws Exception;

    int updateMem(CmpMemberVo vo) throws Exception;

    int approveMem(CmpMemberVo vo) throws Exception;

    int deleteMem(String bizNo, String id) throws Exception;

    int changePw(CmpMemberVo vo) throws Exception;

    //걸어온 발자취 관리
    int tracePost(TraceVO vo, AttachVO attachVO) throws Exception;

    Map<String, Object> traceList(TraceVO vo) throws Exception;

    TraceVO traceView(int seq) throws Exception;

    int traceUpdate(TraceVO vo)  throws Exception;

    int traceDelete(int seq, TraceVO vo) throws Exception;

    int readyPost(BoardVO vo, AttachVO attachVO) throws Exception;

    int updatePost(BoardVO vo) throws Exception;

    List<AttachVO> getAttachList(TraceVO vo) throws Exception;

    Map<String, Object> recomList(RcmdVO vo) throws Exception;

    // 메인 배너 list
    Map<String, Object> banList(BannerVO vo) throws Exception;

    int banPost(BannerVO vo) throws Exception;

    BannerVO bannerView(BannerVO vo) throws Exception;

    int bannerEdit(BannerVO vo) throws Exception;

    int bannerDelete(BannerVO vo) throws Exception;

    Map<String, Object> contact(ContactVO vo) throws Exception;

    ContactVO conView(ContactVO vo) throws Exception;

    int conPost(ContactVO vo) throws Exception;

    int conEdit(ContactVO vo) throws Exception;

    int conDelete(ContactVO vo) throws Exception;
}
