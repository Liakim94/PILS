package kr.co.xicom.front.service.impl;

import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.mapper.ConsultingMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ConsultingServiceImpl implements ConsultingService {
    @Autowired
    private ConsultingMapper mapper;

    @Autowired
    private DataSourceTransactionManager transactionManager;

    @Override
    public int insertConsulting(CmpMemberVo vo) throws Exception {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
           int result= mapper.insertConsulting(vo);
            int result2=  mapper.insertMemberInfo(vo);
            if(result  > 0 && result2>0){
                return 1;
            }else{
                return 0;
            }

        }catch (Exception e){
            transactionManager.rollback(status);
        }
        return 0;
    }
    public  Map<String, Object> list(CmpMemberVo vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        List<CmpMemberVo> list = null;
        int cnt = 0;

        try{
            list = mapper.list(vo);
            cnt = mapper.listCount(vo);

            map.put("resultList",list);
            map.put("resultCnt", cnt);
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return map;
    }

    @Override
    public int conChkPw(CmpMemberVo vo) throws Exception {
        return mapper.conChkPw(vo);
    }
    @Override
    public CmpMemberVo getViewByBizNo(CmpMemberVo vo) throws Exception{
    return mapper.getViewByBizNo(vo);
    }
    @Override
    public int update(CmpMemberVo vo) throws Exception{
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
            int result= mapper.update(vo);
            int result2=  mapper.memUpdate(vo);
            if(result  > 0 && result2>0){
                return 1;
            }else{
                return 0;
            }

        }catch (Exception e){
            transactionManager.rollback(status);
        }
        return 0;
    }

    //동행기업 신청
    @Override
    public int insertJoinApply(CmpMemberVo vo) throws Exception {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
            int result= mapper.insertJoin(vo);
            int result2=  mapper.insertMemberJoin(vo);
            if(result  > 0 && result2>0){
                return 1;
            }else{
                return 0;
            }

        }catch (Exception e){
            transactionManager.rollback(status);
        }
        return 0;
    }

}
