package kr.co.xicom.front.service.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.co.xicom.front.model.AttachVO;

import java.util.List;

@Mapper
public interface AttachMapper {

    /**
     * 첨부파일 데이터 생성*
     * @param attachVO
     * @throws Exception
     */
    void create(AttachVO attachVO) throws Exception;

    /**
     * 특정 게시글의 첨부파일 리스트 추출*
     * @param attachVO bbsId, bbsSeq 필수!
     * @return
     * @throws Exception
     */
    List<AttachVO> list(AttachVO attachVO) throws Exception;

    /**
     * 특정 게시글의 첨부파일 리스트 삭제*
     * @param attachVO bbsId, bbsSeq 필수!
     * @throws Exception
     */
    void delete(AttachVO attachVO) throws Exception;


    /**
     * 동행기업 신청 -첨부서류 insert
     */
    void joinCreate(AttachVO attachVO) throws Exception;
    /**
     * 동행기업 신청 - 첨부서류 리스트 추출
     */
    List<AttachVO> joinList(AttachVO attachVO) throws Exception;

}
