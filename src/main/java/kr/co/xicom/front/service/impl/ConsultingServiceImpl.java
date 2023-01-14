package kr.co.xicom.front.service.impl;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CmpSttusVO;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.mapper.AttachMapper;
import kr.co.xicom.front.service.mapper.BoardMapper;
import kr.co.xicom.front.service.mapper.ConsultingMapper;
import kr.co.xicom.util.HtmlTagUtils;
import kr.go.smes.fileservice.FileService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ConsultingServiceImpl implements ConsultingService {
    @Autowired
    private ConsultingMapper mapper;
    @Autowired
    private BoardMapper boardMapper;
    /** 첨부파일 Mapper */
    @Resource
    private AttachMapper attachMapper;
    /** 파일서비스 */
    @Resource
    private FileService nasFileService;

    @Autowired
    private DataSourceTransactionManager transactionManager;

    @Override
    public int insertConsulting(CmpMemberVo vo, CmpSttusVO stVO) throws Exception {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
           int result= mapper.insertConsulting(vo);
            int result2=  mapper.insertMemberInfo(vo);
            int result3= mapper.insertCmpSttus(stVO);

            if(result  > 0 && result2>0 && result3>0){
                return 1;
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
    public int update(CmpMemberVo vo,CmpSttusVO stVO) throws Exception{
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
            int result= mapper.update(vo);
            int result2=  mapper.memUpdate(vo);
            int result3 = mapper.updateCmpSttus(stVO);
            if(result  > 0 && result2 > 0 && result3 > 0){
                return 1;
            }else{
                return 0;
            }

        }catch (Exception e){
            transactionManager.rollback(status);
        }
        return 0;
    }

    @Override
    public int conCheck(CmpMemberVo vo) throws Exception {
        return mapper.conCheck(vo);
    }

    //동행기업 신청
    @Override
    public int insertJoinApply(CmpMemberVo vo, CmpSttusVO stVO, AttachVO attachVO) throws Exception {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
            int result= mapper.insertJoin(vo);
            int result2=  mapper.insertMemberJoin(vo);
            int result3= mapper.insertCmpSttus(stVO);

            String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
            if (StringUtils.isNotBlank(jsonFileList)) {
                // 업로드 결과 JSON 문자열을 파싱한다.
                Gson gson = new Gson();
                List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>(){}.getType());
                if (attachList != null) {
                    for (int i=0; i<attachList.size(); i++) {
                        AttachVO attach = attachList.get(i);
                        attach.setBizNo(vo.getBizNo());
                        attach.setBbsId(1);
                        attach.setRegSeq(vo.getRegSeq());
                        attach.setUpdSeq(vo.getUpdSeq());
                        attach.setRegNm(vo.getRegNm());
                        attach.setUpdNm(vo.getUpdNm());
                        FilenameUtils.getExtension(attach.getFileNm());

                        attachMapper.create(attach);
                    }
                }
            }
            if(result  > 0 && result2 > 0 && result3 > 0){
                return 1;
            }
        }catch (Exception e){
            transactionManager.rollback(status);
        }
        return 0;
    }

    //동행기업 수정
    @Override
    public int updateJoin(CmpMemberVo vo, CmpSttusVO stVO) throws Exception{
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
            int result=  mapper.updateJoin(vo);
            int result2 = mapper.updateCmpSttus(stVO);

            if(result  > 0 && result2 > 0){
                return 1;
            } else{
                return 0;
            }
        }catch (Exception e){
            transactionManager.rollback(status);
            System.out.println(e.toString());
        }
        return 0;
    }

    //기업현황
    @Override
    public List<CmpSttusVO>  getCmpSttus(CmpSttusVO vo) throws Exception{

        Map<String,Object> map = new HashMap<String,Object>();
        List<CmpSttusVO> list = mapper.getCmpSttus(vo);
//        map.put("rsList",list);
        return list;
    }

}
