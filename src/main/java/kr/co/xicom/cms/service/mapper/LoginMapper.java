package kr.co.xicom.cms.service.mapper;

import kr.co.xicom.cms.model.MemberVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("LoginMapper")
public interface LoginMapper {

	MemberVO getMemById(MemberVO vo) throws Exception;


}
