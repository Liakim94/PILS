package kr.co.xicom.front.service.impl;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.co.xicom.front.model.*;
import kr.co.xicom.front.service.ConsultingService;
import kr.co.xicom.front.service.mapper.AttachMapper;
import kr.co.xicom.front.service.mapper.BoardMapper;
import kr.co.xicom.front.service.mapper.ConsultingMapper;
import kr.co.xicom.front.service.mapper.RcmdMapper;
import kr.co.xicom.util.HtmlTagUtils;
import kr.go.smes.fileservice.FileService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
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
    private RcmdMapper rcmdMapper;

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
        int joinCmp =0;

        try{
            list = mapper.list(vo);
            cnt = mapper.mainCount(vo);
            joinCmp = mapper.joinCmp(vo);
            map.put("resultList",list);
            map.put("resultCnt", cnt);
            map.put("joinCmpCnt",joinCmp);
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
    @Override
    public int checkBizno(String bizNo) throws Exception{
        if(mapper.checkBizno(bizNo)==null){
            return 0;
        }
        return 1;
    }
    @Override
    public int checkId(String id) throws Exception{
        if(mapper.checkId(id)==null){
            return 0;
        }else {
            return 1;
        }
    }
    //동행기업 신청
    @Override
//    public int insertJoinApply(CmpMemberVo vo, CmpSttusVO stVO, AttachVO attachVO) throws Exception {
    public int insertJoinApply(CmpMemberVo vo, AttachVO attachVO) throws Exception {

        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try{
            int result1= mapper.insertJoin(vo);
            int result2=  mapper.insertMemberJoin(vo);

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
                        attach.setAttchCode("M602"); //첨부서류 구분코드
                        attach.setRegSeq(vo.getRegSeq());
                        attach.setUpdSeq(vo.getUpdSeq());
                        attach.setRegNm(vo.getRegNm());
                        attach.setUpdNm(vo.getUpdNm());
                        FilenameUtils.getExtension(attach.getFileNm());

                        attachMapper.joinAttCreate(attach);
                    }
                }
            }

            transactionManager.commit(status);
            return 1;
        } catch (Exception e) {
            transactionManager.rollback(status);
            System.out.println(e.toString());
        }
        return 0;
    }


    //동행기업 수정
    @Override
//    public int updateJoin(CmpMemberVo vo, CmpSttusVO stVO, AttachVO attachVO) throws Exception {
        public int updateJoin(CmpMemberVo vo, AttachVO attachVO) throws Exception {

            DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        try {
            int result1 = mapper.updateJoin(vo);
//            int result2 = mapper.updateCmpSttus(stVO);

            AttachVO attach = new AttachVO();
            attach.setBizNo(vo.getBizNo());
            attach.setBbsId(1);
            attach.setAttchCode("M602");
            this.attachMapper.joinAttDelete(attach);

            String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
            if (StringUtils.isNotBlank(jsonFileList)) {
                // 업로드 결과 JSON 문자열을 파싱한다.
                Gson gson = new Gson();
                List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>(){}.getType());
                if (attachList != null) {
                    for (int i=0; i<attachList.size(); i++) {
                        attach = attachList.get(i);
                        attach.setBizNo(vo.getBizNo());
                        attach.setBbsId(1);
                        attach.setAttchCode("M602"); //첨부서류 구분코드
                        attach.setRegSeq(vo.getRegSeq());
                        attach.setUpdSeq(vo.getUpdSeq());
                        attach.setRegNm(vo.getRegNm());
                        attach.setUpdNm(vo.getUpdNm());
                        FilenameUtils.getExtension(attach.getFileNm());
                        attach.setFileStd(vo.getFileStd());
                        attachMapper.joinAttCreate(attach);
                    }
                }
            }
            //첨부파일 삭제
            String jsonDeleteFileList = HtmlTagUtils.restore(vo.getJsonDeletedFileList());
            if (StringUtils.isNotBlank(jsonDeleteFileList)) {
                Gson gson = new Gson();
                List<AttachVO> deleteFileList = gson.fromJson(jsonDeleteFileList, new TypeToken<List<AttachVO>>() {
                }.getType());
                if (deleteFileList != null && deleteFileList.size() > 0) {
                    for (AttachVO delFile : deleteFileList) {
                        this.nasFileService.deleteFile(delFile.getFilePath(), delFile.getFileNm());
                    }
                }
            }
            transactionManager.commit(status);
            return 1;
        } catch (Exception e) {
            transactionManager.rollback(status);
            System.out.println(e.toString());
        }
        return 0;
    }

    //기업현황
    @Override
    public List<CmpSttusVO>  getCmpSttus(CmpSttusVO vo) throws Exception{

        List<CmpSttusVO> list = mapper.getCmpSttus(vo);
        if(list.isEmpty()){
            List<CmpSttusVO> isEmpty=  mapper.sttusIsEmpty(vo);
            return isEmpty;
        }else {
            return list;
        }
    }

    // 동행기업 첨부서류 리스트 추출
    @Override
    public List<AttachVO> getAttachList(CmpMemberVo vo) throws Exception {

        AttachVO attachVO = new AttachVO();
        attachVO.setBizNo(vo.getBizNo());
        attachVO.setBbsId(1);
        attachVO.setAttchCode("M602");

        return attachMapper.joinAttList(attachVO);
    }
    //동행기업 참여 추천
    @Override
    public int insertRecom(RcmdVO vo) throws Exception{
      return rcmdMapper.insertRcmd(vo);
    }

    @Override
    public RcmdVO rcmdView(int no ) throws Exception{
        return rcmdMapper.rcmdView(no);
    }

}
