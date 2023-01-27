package kr.co.xicom.front.service;

import kr.co.xicom.front.model.AgreementVO;
import org.springframework.stereotype.Service;

@Service
public interface AgreementService {
    int apply(AgreementVO vo) throws Exception;

    AgreementVO agreeView(String id) throws Exception;

    String agreeChk(String id) throws Exception;

    int agreeDelete(String id) throws Exception;
}
