package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.CmpMemberVo;

import java.util.List;

/**
 * 참여기업 Mapper.
 * @author WildRain
 * @since 2023-01-27
 */
@Mapper
public interface CompanyMapper {

    /**
     * 참여기업 리스트 추출
     * @param cmpMemberVo
     * @return
     * @throws Exception
     */
    List<CmpMemberVo> list(CmpMemberVo cmpMemberVo) throws Exception;

    /**
     * 참여기업 상체 수출
     * @param bizNo 사업자번호
     * @return
     * @throws Exception
     */
    CmpMemberVo details(int bizNo) throws Exception;

    /**
     * 참여기업 정보 수정
     * @param cmpMemberVo
     * @throws Exception
     */
    void update(CmpMemberVo cmpMemberVo) throws Exception;

}
