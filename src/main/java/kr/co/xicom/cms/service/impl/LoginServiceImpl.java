package kr.co.xicom.cms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.xicom.cms.model.MemberVO;
import kr.co.xicom.cms.service.LoginService;
import kr.co.xicom.cms.service.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper loginMapper;
	
	
	@Override
	public MemberVO getView(MemberVO vo) throws Exception {
		return loginMapper.getMemById(vo);
	}


}
