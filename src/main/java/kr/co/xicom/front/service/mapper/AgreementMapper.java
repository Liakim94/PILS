package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.AgreementVO;

import java.util.List;

@Mapper("AgreementMapper")
public interface AgreementMapper {

    List<AgreementVO> agreeList(AgreementVO vo) throws Exception;
    int agreeListCount(AgreementVO vo) throws Exception;
    int apply(AgreementVO vo) throws Exception;
    int agreeEdit(AgreementVO vo) throws Exception;
    AgreementVO agreeViewAdmin(AgreementVO vo) throws Exception;
    AgreementVO agreeView(String id) throws Exception;
    String agreeChk(String id) throws Exception;
    int agreeDelete(String id) throws Exception;
    int agreeDeleteAdmin(AgreementVO vo) throws Exception;
}
