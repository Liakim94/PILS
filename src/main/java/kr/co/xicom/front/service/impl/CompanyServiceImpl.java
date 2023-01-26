package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.CompanyService;
import kr.co.xicom.front.service.mapper.CompanyMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 참여회사 Service 구현.
 * @author WildRain
 * @since 2023-01-27
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    /** 참여기업 mapper */
    @Resource
    private CompanyMapper companyMapper;

    @Override
    public CmpMemberVo details(int bizNo) throws Exception {
        return null;
    }

    @Override
    public List<CmpMemberVo> list() throws Exception {
        CmpMemberVo cmpMemberVo = new CmpMemberVo();
        cmpMemberVo.setMem_cd("M302");
        return this.companyMapper.list(cmpMemberVo);
    }

    @Override
    public int create(CmpMemberVo cmpMemberVo) throws Exception {
        return 0;
    }

    @Override
    public void update(CmpMemberVo cmpMemberVo) throws Exception {

    }

    @Override
    public void delete(int bizNo) throws Exception {

    }
}
