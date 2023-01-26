package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.CompanyAttachVO;

import java.util.List;

/**
 * 참여기업 첨부파일 Mapper
 * @author WildRain
 * @since 2023-01-27
 */
@Mapper
public interface CompanyAttachMapper {

    /**
     * 첨부파일 데이터 생성
     * @param attachVO
     * @throws Exception
     */
    void create(CompanyAttachVO attachVO) throws Exception;

    /**
     * 특정 사업자, 특정 첨부유형의 첨부파일 리스트 추출*
     * @param attachVO bizNo, atchType 필수
     * @return
     * @throws Exception
     */
    List<CompanyAttachVO> list(CompanyAttachVO attachVO) throws Exception;

    /**
     * 특정 사업자, 특정 첨뷰유형의 첨부파일 삭제
     * @param attachVO bizNo, atchType 필수
     * @throws Exception
     */
    void delete(CompanyAttachVO attachVO) throws Exception;

}
