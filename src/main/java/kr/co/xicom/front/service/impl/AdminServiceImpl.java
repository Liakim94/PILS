package kr.co.xicom.front.service.impl;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.co.xicom.front.model.AttachVO;
import kr.co.xicom.front.model.BoardVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.TraceVO;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.mapper.AdminMapper;
import kr.co.xicom.front.service.mapper.AttachMapper;
import kr.co.xicom.front.service.mapper.BoardMapper;
import kr.co.xicom.front.service.mapper.ConsultingMapper;
import kr.co.xicom.util.HtmlTagUtils;
import kr.go.smes.fileservice.FileService;
import org.apache.commons.collections.functors.ExceptionPredicate;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Autowired
    private BoardMapper boardMapper;
    @Autowired
    private AttachMapper attachMapper;
    @Autowired
    ConsultingMapper consultingMapper;
    @Autowired
    private DataSourceTransactionManager transactionManager;
    /**
     * Logger
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);
    /**
     * 파일서비스
     */
    @Resource
    private FileService nasFileService;

    //동행기업 list
    @Override
    public Map<String, Object> joinList(CmpMemberVo vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<CmpMemberVo> list = adminMapper.joinList(vo);
        int cnt = adminMapper.listCount(vo);
        map.put("resultList", list);
        map.put("resultCnt", cnt);
        return map;
    }
    //컨설팅 list
    @Override
    public  Map<String, Object> conList(CmpMemberVo vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<CmpMemberVo> list = null;
        int cnt = 0;
        try{
            list = consultingMapper.list(vo);
            cnt = consultingMapper.listCount(vo);
            map.put("resultList",list);
            map.put("resultCnt", cnt);
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return map;
    }

    //담당자 관리
    @Override
    public List<CmpMemberVo> memManageList(CmpMemberVo vo) throws Exception {
        return adminMapper.memManageList(vo);
    }

    //걸어온 발자취 관리
    @Override
    public int tracePost(TraceVO vo, AttachVO attachVO) throws Exception {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        int result = 0;
        try {
            result = adminMapper.tracePost(vo);

            String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
            if (StringUtils.isNotBlank(jsonFileList)) {
                Gson gson = new Gson();
                List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>() {
                }.getType());
                if (attachList != null) {
                    for (int i = 0; i < attachList.size(); i++) {
                        AttachVO attach = attachList.get(i);
                        attach.setBoardSeq(vo.getSeq());
                        attach.setBbsId(5);
                        attach.setRegSeq(vo.getRegSeq());
                        attach.setUpdSeq(vo.getUpdSeq());
                        attach.setRegNm(vo.getRegNm());
                        attach.setUpdNm(vo.getUpdNm());
                        FilenameUtils.getExtension(attach.getFileNm());

                        attachMapper.create(attach);
                    }
                }
            }
            transactionManager.commit(status);
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            transactionManager.rollback(status);
        }
        return result;
    }

    @Override
    public Map<String, Object> traceList(TraceVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();

        int cnt = adminMapper.traceCount(vo);
        List<TraceVO> list = adminMapper.traceList(vo);

        map.put("resultList", list);
        map.put("resultCnt", cnt);
        return map;
    }

    @Override
    public TraceVO traceView(int seq) throws Exception {
        return adminMapper.traceView(seq);
    }

    @Override
    public int traceUpdate(TraceVO vo) throws Exception {
        int result = adminMapper.traceUpdate(vo);
        // 기존 첨부파일 정보 삭제
        AttachVO attach = new AttachVO();
        attach.setBoardSeq(vo.getSeq());
        attach.setBbsId(5);
        this.attachMapper.delete(attach);
        // 다시 첨부파일 정보 등록
        String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
        if (StringUtils.isNotBlank(jsonFileList)) {
            // 업로드 결과 JSON 문자열을 파싱한다.
            Gson gson = new Gson();
            List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>() {
            }.getType());
            if (attachList != null) {
                for (int i = 0; i < attachList.size(); i++) {
                    attach = attachList.get(i);
                    attach.setBoardSeq(vo.getSeq());
                    attach.setBbsId(5);
                    attach.setRegSeq(vo.getRegSeq());
                    attach.setUpdSeq(vo.getUpdSeq());
                    attach.setRegNm(vo.getRegNm());
                    attach.setUpdNm(vo.getUpdNm());
                    FilenameUtils.getExtension(attach.getFileNm());

                    attachMapper.create(attach);
                }
            }
        }

        // 실제 첨부파일 삭제 처리
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
        return result;
    }

    @Override
    public int traceDelete(int seq, TraceVO vo) throws Exception {
        int result = adminMapper.traceDelete(seq);
        AttachVO attach = new AttachVO();
        attach.setBoardSeq(vo.getSeq());
        attach.setBbsId(5);
        this.attachMapper.delete(attach);

        return result;
    }

    //카드뉴스 관리
    @Override
    public int readyPost(BoardVO vo, AttachVO attachVO) throws Exception {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

        TransactionStatus status = transactionManager.getTransaction(def);

        int result = 0;
        try {
            result = boardMapper.addBoard(vo);

            String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
            if (StringUtils.isNotBlank(jsonFileList)) {
                Gson gson = new Gson();
                List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>() {
                }.getType());
                if (attachList != null) {
                    for (int i = 0; i < attachList.size(); i++) {
                        AttachVO attach = attachList.get(i);
                        attach.setBoardSeq(vo.getBoardSeq());
                        attach.setBbsId(6);
                        attach.setRegSeq(vo.getRegSeq());
                        attach.setUpdSeq(vo.getUpdSeq());
                        attach.setRegNm(vo.getRegNm());
                        attach.setUpdNm(vo.getUpdNm());
                        FilenameUtils.getExtension(attach.getFileNm());

                        attachMapper.create(attach);
                    }
                }
            }
            transactionManager.commit(status);
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            transactionManager.rollback(status);
        }
        return result;
    }

    @Override
    public int updatePost(BoardVO vo) throws Exception {
        int result = boardMapper.updateBoard(vo);

        AttachVO attach = new AttachVO();
        attach.setBoardSeq(vo.getBoardSeq());
        attach.setBbsId(6);
        this.attachMapper.delete(attach);
        // 다시 첨부파일 정보 등록
        String jsonFileList = HtmlTagUtils.restore(vo.getJsonFileList());
        if (StringUtils.isNotBlank(jsonFileList)) {
            // 업로드 결과 JSON 문자열을 파싱한다.
            Gson gson = new Gson();
            List<AttachVO> attachList = gson.fromJson(jsonFileList, new TypeToken<List<AttachVO>>() {
            }.getType());
            if (attachList != null) {
                for (int i = 0; i < attachList.size(); i++) {
                    attach = attachList.get(i);
                    attach.setBoardSeq(vo.getBoardSeq());
                    attach.setBbsId(6);
                    attach.setRegSeq(vo.getRegSeq());
                    attach.setUpdSeq(vo.getUpdSeq());
                    attach.setRegNm(vo.getRegNm());
                    attach.setUpdNm(vo.getUpdNm());
                    FilenameUtils.getExtension(attach.getFileNm());

                    attachMapper.create(attach);
                }
            }
        }
        // 실제 첨부파일 삭제 처리
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
        return result;
    }

    @Override
    public List<AttachVO> getAttachList(TraceVO vo) throws Exception {

        AttachVO attachVO = new AttachVO();
        attachVO.setBoardSeq(vo.getSeq());
        attachVO.setBbsId(5);

        return attachMapper.list(attachVO);

    }
}
