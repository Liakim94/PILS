package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.AgreementVO;

@Mapper("AgreementMapper")
public interface AgreementMapper {
    int apply(AgreementVO vo) throws Exception;
    AgreementVO agreeView(String id) throws Exception;
    String agreeChk(String id) throws Exception;
    int agreeDelete(String id) throws Exception;
}
