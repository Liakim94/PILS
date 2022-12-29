package kr.co.xicom.cms.service;

import kr.co.xicom.cms.model.MemberVO;

import org.springframework.stereotype.Service;

@Service
public interface LoginService {

	MemberVO getView(MemberVO memberVO) throws Exception; 	//회원로그인

	
}