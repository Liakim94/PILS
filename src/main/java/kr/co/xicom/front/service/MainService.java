package kr.co.xicom.front.service;

import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BannerVO;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.model.CmpMemberVo;
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
}
