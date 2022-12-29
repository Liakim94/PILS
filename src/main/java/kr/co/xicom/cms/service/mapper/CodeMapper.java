package kr.co.xicom.cms.service.mapper;

import java.util.List;

import kr.co.xicom.cms.model.CodeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("CodeMapper")
public interface CodeMapper {

	List<CodeVO> getCategoryList() throws Exception;

	List<CodeVO> getCodeList(CodeVO vo) throws Exception;

	int addCode(CodeVO vo) throws Exception;

	CodeVO getCodeById(CodeVO vo) throws Exception;

	int updateCode(CodeVO vo) throws Exception;

	int updateCodeSort(CodeVO vo) throws Exception;

}
