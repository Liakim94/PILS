package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.MainService;
import kr.co.xicom.front.service.mapper.AdminMapper;
import kr.co.xicom.front.service.mapper.AttachMapper;
import kr.co.xicom.front.service.mapper.MainMapper;
import kr.go.smes.fileservice.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class MainServiceImpl implements MainService {
    @Autowired
    private MainMapper mapper;


    /** 첨부파일 Mapper */
    @Resource
    private AttachMapper attachMapper;

    /** 파일서비스 */
    @Resource
    private FileService nasFileService;

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
