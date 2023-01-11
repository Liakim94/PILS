package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.MainService;
import kr.co.xicom.front.service.mapper.MainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MainServiceImpl implements MainService {
    @Autowired
    private MainMapper mapper;

    @Override
    public int memberLogin(CmpMemberVo memberVo) throws Exception {
        int result =0;
        try{
           result = mapper.memberLogin(memberVo);
            if( result >0){
                return 1;
            }
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return result;
    }

    @Override
    public String memberBizno(String id) throws Exception {
        return mapper.memberBizno(id);
    }

    @Override
    public List<CmpMemberVo> memManage(CmpMemberVo vo) throws Exception {
        return  mapper.memManage(vo);
    }
    @Override
    public int memAdd(CmpMemberVo vo) throws Exception{
        return mapper.memAdd(vo);
    }

    @Override
    public CmpMemberVo getMemInfo(CmpMemberVo vo) throws Exception{
        return mapper.getMemInfo(vo);
    }

    @Override
    public CmpMemberVo memEdit(CmpMemberVo vo) throws Exception{
        return mapper.memEdit(vo);
    }
    @Override
    public int updateMem(CmpMemberVo vo) throws Exception{
        return mapper.updateMem(vo);
    }

    @Override
    public int changePw(CmpMemberVo vo) throws Exception{
        return mapper.changePw(vo);
    }


}
