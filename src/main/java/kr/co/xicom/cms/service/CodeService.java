package kr.co.xicom.cms.service;

import java.util.List;

import kr.co.xicom.cms.model.CodeVO;

import org.springframework.stereotype.Service;

@Service
public interface CodeService {

	List<CodeVO> list() throws Exception;

	List<CodeVO> list(CodeVO vo) throws Exception;

	int add(CodeVO vo) throws Exception;

	CodeVO get(CodeVO vo) throws Exception;

	int update(CodeVO vo) throws Exception;

	int update(String data, String arg) throws Exception;

}