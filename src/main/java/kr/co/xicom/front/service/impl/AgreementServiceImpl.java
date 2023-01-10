package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.AgreementVO;
import kr.co.xicom.front.service.AgreementService;
import kr.co.xicom.front.service.mapper.AgreementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AgreementServiceImpl implements AgreementService {
    @Autowired
    private AgreementMapper mapper;

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
    public AgreementVO agreeView(String id) throws Exception{
        return mapper.agreeView(id);
    }
}
