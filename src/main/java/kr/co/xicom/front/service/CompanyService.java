package kr.co.xicom.front.service;

import kr.co.xicom.front.model.CmpMemberVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 참여회사 Service.
 * @author WildRain
 * @since 2023-01-26
 */
@Service
public interface CompanyService {

    /**
     * 참여회사 상세 정보 추출.
     * @param bizNo 사업자번호
     * @return
     * @throws Exception
     */
    CmpMemberVo details(String bizNo) throws Exception;

    /**
     * 참여회사 리스트 추출.
     * @return
     * @throws Exception
     */
    List<CmpMemberVo> list() throws Exception;

    /**
     * 참여회사 등록.
     * @param cmpMemberVo
     * @return
     * @throws Exception
     */
    int create(CmpMemberVo cmpMemberVo) throws Exception;

    /**
     * 참여회사 수정.
     * @param cmpMemberVo
     * @throws Exception
     */
    void update(CmpMemberVo cmpMemberVo) throws Exception;

    /**
     * 참여회사 삭제
     * @param bizNo
     * @throws Exception
     */
    void delete(int bizNo) throws Exception;

}
