package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.AgreementVO;
import kr.co.xicom.front.service.AgreementService;
import kr.co.xicom.front.service.mapper.AgreementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AgreementServiceImpl implements AgreementService {
    @Autowired
    private AgreementMapper mapper;

    //담당자페이지 list
    @Override
    public Map<String, Object> agreeList(AgreementVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<AgreementVO> list = null;
        int cnt = 0;
        try{
            vo.setType_cd("M101");
            list = mapper.agreeList(vo);
            cnt = mapper.agreeListCount(vo);
            map.put("resultList",list);
            map.put("resultCnt", cnt);
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return map;
    }

    @Override
    public int apply(AgreementVO vo) throws Exception {
        try {
            int result = mapper.apply(vo);
            if (result > 0) {
                return 1;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return 0;
    }

    @Override
    public AgreementVO agreeViewAdmin(AgreementVO vo) throws Exception{
        return mapper.agreeViewAdmin(vo);
    }
    @Override
    public int agreeEdit(AgreementVO vo) throws Exception {
        try {
            int result = mapper.agreeEdit(vo);
            if (result > 0) {
                return 1;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return 0;
    }

    @Override
    public AgreementVO agreeView(String id) throws Exception{
        return mapper.agreeView(id);
    }

    @Override
    public String agreeChk(String id) throws Exception{
        return mapper.agreeChk(id);
    }

    @Override
    public int agreeDelete(String id) throws Exception{
        return mapper.agreeDelete(id);
    }

    @Override
    public int agreeDeleteAdmin(AgreementVO vo) throws Exception{
        return mapper.agreeDeleteAdmin(vo);
    }
}
