package kr.co.xicom.front.service.impl;

import com.google.gson.Gson;
import kr.co.xicom.front.model.BannerVO;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.PerformanceVO;
import kr.co.xicom.front.service.MainService;
import kr.co.xicom.front.service.mapper.AttachMapper;
import kr.co.xicom.front.service.mapper.ConsultingMapper;
import kr.co.xicom.front.service.mapper.MainMapper;
import kr.go.smes.fileservice.FileService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MainServiceImpl implements MainService {
    @Autowired
    private MainMapper mapper;

    @Autowired
    private ConsultingMapper consultingMapper;

    /** 첨부파일 Mapper */
    @Resource
    private AttachMapper attachMapper;

    /** 파일서비스 */
    @Resource
    private FileService nasFileService;
    /**
     * Logger
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(BoardServiceImpl.class);


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
    public String memAuthCd(String id) throws Exception {
        return mapper.memAuthCd(id);
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

    @Override
    public List<BannerVO> bannerAll(BannerVO vo) throws Exception{
        return mapper.bannerAll(vo);
    }

    @Override
    public int mbrApply(CmpMemberVo vo) throws Exception{
        return   consultingMapper.insertMemberJoin(vo);
    }

    @Override
    public CmpMemberVo getViewById(CmpMemberVo vo) throws Exception{
        return   consultingMapper.getViewById(vo);
    }

    //동행기업 실적 제출하기
    @Override
    public Map<String, Object> perfList(String id) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        List<PerformanceVO> list = mapper.perfList(id);
        int cnt = mapper.perfCount(id);
        map.put("resultList", list);
        map.put("resultCnt", cnt);
        return map;
    }
    @Override
    public int perfApply(PerformanceVO vo) throws Exception{
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
        return mapper.perfApply(vo);
    }
    @Override
    public PerformanceVO perfView(PerformanceVO vo) throws Exception{
        return   mapper.perfView(vo);
    }
    @Override
    public int perfDelete(int seq) throws Exception {
        return mapper.perfDelete(seq);
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
        return mapper.perfEdit(vo);
    }
}
