package kr.co.xicom.front.service.impl;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import kr.co.xicom.front.model.*;
import kr.co.xicom.front.service.AdminService;
import kr.co.xicom.front.service.mapper.AdminMapper;
import kr.co.xicom.front.service.mapper.AttachMapper;
import kr.co.xicom.front.service.mapper.BoardMapper;
import kr.co.xicom.front.service.mapper.ConsultingMapper;
import kr.co.xicom.util.HtmlTagUtils;
import kr.go.smes.fileservice.FileService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.annotation.Resource;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;
    private final BoardMapper boardMapper;
    private final AttachMapper attachMapper;
    private final ConsultingMapper consultingMapper;
    private final DataSourceTransactionManager transactionManager;

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
    //동행기업 상세화면
    @Override
    public CmpMemberVo memInfo(CmpMemberVo vo) throws Exception {
        return adminMapper.memInfo(vo);
    }
    //동행기업 삭제하기
    @Override
    public int deleteCmp(String bizNo) throws Exception{
        return adminMapper.deleteCmp(bizNo);
    }
    //컨설팅 list
    @Override
    public  Map<String, Object> consultList(ConsultingVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<ConsultingVO> list = null;
        int cnt = 0;
        try{
            list = consultingMapper.consultList(vo);
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
    public Map<String, Object> memManageList(CmpMemberVo vo) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        List<CmpMemberVo> list = null;
        int cnt = 0;
        try{
            list = adminMapper.memManageList(vo);
            cnt = adminMapper.memManageListCount(vo);
            map.put("resultList",list);
            map.put("resultCnt", cnt);
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return map;
    }

    @Override
    public CmpMemberVo memEdit(CmpMemberVo vo) throws Exception{
        return adminMapper.memEdit(vo);
    }
    @Override
    public int updateMem(CmpMemberVo vo) throws Exception{
        return adminMapper.updateMem(vo);
    }
    @Override
    public int approveMem(CmpMemberVo vo) throws Exception{
        return adminMapper.approveMem(vo);
    }
    @Override
    public int deleteMem(String bizNo, String id) throws Exception{
        return adminMapper.deleteMem(bizNo, id);
    }
    @Override
    public int changePw(CmpMemberVo vo) throws Exception{
        return adminMapper.changePw(vo);
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
                        attach.setBbsId(vo.getBbsId());
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
        attach.setBbsId(vo.getBbsId());
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
                    attach.setBbsId(vo.getBbsId());
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

    //걸어온발자취 첨부파일 list
    @Override
    public List<AttachVO> getAttachList(TraceVO vo) throws Exception {

        AttachVO attachVO = new AttachVO();
        attachVO.setBoardSeq(vo.getSeq());
        attachVO.setBbsId(5);

        return attachMapper.list(attachVO);

    }

    @Override
    public Map<String, Object> recomList(RcmdVO vo) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        List<RcmdVO> list = adminMapper.recomList(vo);
        int cnt = adminMapper.recomCount(vo);
        map.put("resultList", list);
        map.put("resultCnt", cnt);
        return map;
    }

    // 메인 배너 list
    @Override
    public Map<String, Object> banList(BannerVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<BannerVO> list = adminMapper.banList(vo);
        int cnt = adminMapper.banCount(vo);
        map.put("resultList", list);
        map.put("resultCnt", cnt);
        return map;
    }
    @Override
    public int banPost(BannerVO vo) throws Exception {
        try {
            // JSON 처리용 Gson
            Gson gson = new Gson();
            Type listType = new com.google.common.reflect.TypeToken<List<BannerVO>>(){}.getType();

            String pcImage = vo.getJsonPcImage();
            if (!StringUtils.isBlank(pcImage)) {
                // HTMLTagFilter 적용 되돌리기
                pcImage = kr.go.smes.util.HtmlTagUtils.restore(pcImage);
                List<BannerVO> logoAttachs = gson.fromJson(pcImage, listType);
                if (logoAttachs != null && logoAttachs.size() > 0) {
                    vo.setPcImgPath(logoAttachs.get(0).getSavedFilepath());
                }
            }
            String mobileImage = vo.getJsonMobileImage();
            if (!StringUtils.isBlank(mobileImage)) {
                // HTMLTagFilter 적용 되돌리기
                mobileImage = kr.go.smes.util.HtmlTagUtils.restore(mobileImage);
                List<BannerVO> logoAttachs = gson.fromJson(mobileImage, listType);
                if (logoAttachs != null && logoAttachs.size() > 0) {
                    vo.setMobileImgPath(logoAttachs.get(0).getSavedFilepath());
                }
            }
        }
        catch (Exception ex) {
            LOGGER.error(ex.getMessage(), ex);
            throw ex;
        }
        return adminMapper.banPost(vo);
    }

    @Override
    public BannerVO bannerView(BannerVO vo) throws Exception {
        return adminMapper.bannerView(vo);
    }
    @Override
    public int bannerEdit(BannerVO vo) throws Exception {
        try {
            // JSON 처리용 Gson
            Gson gson = new Gson();
            Type listType = new com.google.common.reflect.TypeToken<List<BannerVO>>(){}.getType();

            String pcImage = vo.getJsonPcImage();
            if (!StringUtils.isBlank(pcImage)) {
                // HTMLTagFilter 적용 되돌리기
                pcImage = kr.go.smes.util.HtmlTagUtils.restore(pcImage);
                List<BannerVO> logoAttachs = gson.fromJson(pcImage, listType);
                if (logoAttachs != null && logoAttachs.size() > 0) {
                    vo.setPcImgPath(logoAttachs.get(0).getSavedFilepath());
                }
            }
            String mobileImage = vo.getJsonMobileImage();
            if (!StringUtils.isBlank(mobileImage)) {
                // HTMLTagFilter 적용 되돌리기
                mobileImage = kr.go.smes.util.HtmlTagUtils.restore(mobileImage);
                List<BannerVO> logoAttachs = gson.fromJson(mobileImage, listType);
                if (logoAttachs != null && logoAttachs.size() > 0) {
                    vo.setMobileImgPath(logoAttachs.get(0).getSavedFilepath());
                }
            }
        }
        catch (Exception ex) {
            LOGGER.error(ex.getMessage(), ex);
            throw ex;
        }
        return adminMapper.bannerEdit(vo);
    }
    @Override
    public int bannerDelete(BannerVO vo) throws Exception {
        return adminMapper.bannerDelete(vo);
    }

    @Override
    public Map<String, Object> contact(ContactVO vo) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        List<ContactVO> list = adminMapper.contact(vo);
        int cnt = adminMapper.contactCount(vo);

        map.put("resultList", list);
        map.put("resultCnt", cnt);
        return map;
    }
    @Override
    public  ContactVO conView(ContactVO vo) throws Exception {
        return adminMapper.conView(vo);
    }
    @Override
    public int conPost(ContactVO vo) throws Exception {
        return adminMapper.conPost(vo);
    }
    @Override
    public int conEdit(ContactVO vo) throws Exception {
        return adminMapper.conEdit(vo);
    }
    @Override
    public int conDelete(ContactVO vo) throws Exception {
        return adminMapper.conDelete(vo);
    }

    //동행기업 실적 제출하기
    @Override
    public Map<String, Object> perfList(PerformanceVO vo) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();

        List<PerformanceVO> list = null;
        int cnt = 0;
        try{
            list = adminMapper.perfListSort(vo);
            cnt = adminMapper.perfCount(vo);
            map.put("resultList",list);
            map.put("resultCnt", cnt);
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return map;
    }
    @Override
    public PerformanceVO perfView(PerformanceVO vo) throws Exception{
        return   adminMapper.perfView(vo);
    }
    @Override
    public int perfDelete(int seq) throws Exception {
        return adminMapper.perfDelete(seq);
    }
    @Override
    public int perfEdit(PerformanceVO vo) throws Exception {
        try {
            // JSON 처리용 Gson
            Gson gson = new Gson();
            Type listType = new com.google.common.reflect.TypeToken<List<PerformanceVO>>(){}.getType();

            String intrlck_path = vo.getJsonIntrlckFile();
            if (!StringUtils.isBlank(intrlck_path)) {
                // HTMLTagFilter 적용 되돌리기
                intrlck_path = kr.go.smes.util.HtmlTagUtils.restore(intrlck_path);
                List<PerformanceVO> attachs = gson.fromJson(intrlck_path, listType);
                if (attachs != null && attachs.size() > 0) {
                    vo.setIntrlck(attachs.get(0).getSavedFilepath());

                }
            }
            String change_path = vo.getJsonChangeFile();
            if (!StringUtils.isBlank(change_path)) {
                // HTMLTagFilter 적용 되돌리기
                change_path = kr.go.smes.util.HtmlTagUtils.restore(change_path);
                List<PerformanceVO> attachs = gson.fromJson(change_path, listType);
                if (attachs != null && attachs.size() > 0) {
                    vo.setChange(attachs.get(0).getSavedFilepath());
                }
            }
            String intrlck_perf_path = vo.getJsonIntrlckPerfFile();
            if (!StringUtils.isBlank(intrlck_perf_path)) {
                // HTMLTagFilter 적용 되돌리기
                intrlck_perf_path = kr.go.smes.util.HtmlTagUtils.restore(intrlck_perf_path);
                List<PerformanceVO> attachs = gson.fromJson(intrlck_perf_path, listType);
                if (attachs != null && attachs.size() > 0) {
                    vo.setIntrlck_perf(attachs.get(0).getSavedFilepath());
                }
            }
            String etc_path = vo.getJsonEtcFile();
            if (!StringUtils.isBlank(etc_path)) {
                // HTMLTagFilter 적용 되돌리기
                etc_path = kr.go.smes.util.HtmlTagUtils.restore(etc_path);
                List<PerformanceVO> attachs = gson.fromJson(etc_path, listType);
                if (attachs != null && attachs.size() > 0) {
                    vo.setEtc(attachs.get(0).getSavedFilepath());
                }
            }
        }
        catch (Exception ex) {
            LOGGER.error(ex.getMessage(), ex);
            throw ex;
        }
        return adminMapper.perfEdit(vo);
    }
}
