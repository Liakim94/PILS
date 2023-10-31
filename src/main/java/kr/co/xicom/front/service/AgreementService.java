package kr.co.xicom.front.service;

import kr.co.xicom.front.model.AgreementVO;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface AgreementService {
    //담당자페이지 list
    Map<String, Object> agreeList(AgreementVO vo) throws Exception;

    int apply(AgreementVO vo) throws Exception;

    AgreementVO agreeViewAdmin(AgreementVO vo) throws Exception;

    int agreeEdit(AgreementVO vo) throws Exception;

    AgreementVO agreeView(String id) throws Exception;

    String agreeChk(String id) throws Exception;

    int agreeDelete(String id) throws Exception;

    int agreeDeleteAdmin(AgreementVO vo) throws Exception;
}
