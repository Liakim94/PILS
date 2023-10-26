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
import java.util.List;

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
    public  List<PerformanceVO> perfList(String id) throws Exception{
        return mapper.perfList(id);
    }
    @Override
    public int perfApply(PerformanceVO vo) throws Exception{
        try {
            // JSON 처리용 Gson
            Gson gson = new Gson();
            Type listType = new com.google.common.reflect.TypeToken<List<BannerVO>>(){}.getType();

            String intrlck = vo.getJsonIntrlckFile();
            if (!StringUtils.isBlank(intrlck)) {
                // HTMLTagFilter 적용 되돌리기
                intrlck = kr.go.smes.util.HtmlTagUtils.restore(intrlck);
                List<PerformanceVO> attachs = gson.fromJson(intrlck, listType);
                if (attachs != null && attachs.size() > 0) {
                    vo.setIntrlck(attachs.get(0).getSavedFilepath());

                }
            }
            String change = vo.getJsonChangeFile();
            if (!StringUtils.isBlank(change)) {
                // HTMLTagFilter 적용 되돌리기
                change = kr.go.smes.util.HtmlTagUtils.restore(change);
                List<PerformanceVO> attachs = gson.fromJson(change, listType);
                if (attachs != null && attachs.size() > 0) {
                    vo.setChange(attachs.get(0).getSavedFilepath());
                }
            }
            String intrlck_perf = vo.getJsonIntrlckPerfFile();
            if (!StringUtils.isBlank(intrlck_perf)) {
                // HTMLTagFilter 적용 되돌리기
                intrlck_perf = kr.go.smes.util.HtmlTagUtils.restore(intrlck_perf);
                List<PerformanceVO> attachs = gson.fromJson(intrlck_perf, listType);
                if (attachs != null && attachs.size() > 0) {
                    vo.setIntrlck_perf(attachs.get(0).getSavedFilepath());
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
}
