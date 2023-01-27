package kr.co.xicom.front.service.impl;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import kr.co.xicom.front.model.CmpMemberVo;
import kr.co.xicom.front.model.CompanyAttachVO;
import kr.co.xicom.front.service.CompanyService;
import kr.co.xicom.front.service.mapper.CompanyAttachMapper;
import kr.co.xicom.front.service.mapper.CompanyMapper;
import kr.go.smes.util.HtmlTagUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.Type;
import java.util.List;

/**
 * 참여회사 Service 구현.
 * @author WildRain
 * @since 2023-01-27
 */
@Service
public class CompanyServiceImpl implements CompanyService {

    /** Logger */
    private static final Logger LOGGER = LoggerFactory.getLogger(CompanyServiceImpl.class);

    /** 참여기업 mapper */
    @Resource
    private CompanyMapper companyMapper;

    /** 참여기업 첨부파일 mapper */
    @Resource
    private CompanyAttachMapper companyAttachMapper;

    /**
     * 참여회사 상세 정보 추출.
     * @param bizNo 사업자번호
     * @return
     * @throws Exception
     */
    @Override
    public CmpMemberVo details(String bizNo) throws Exception {
        // 유효성 체크
        if (StringUtils.isBlank(bizNo)) {
            throw new Exception("사업자번호 입력 필수.");
        }

        // 파라미터 생성
        CmpMemberVo cmpMemberVo = CmpMemberVo.builder()
                .bizNo(bizNo)
                .mem_cd("M302")
                .build();

        // 참여기업 상세 데이터 추출
        CmpMemberVo company = this.companyMapper.details(cmpMemberVo);

        // 주요상품 이미지 추출
        CompanyAttachVO attachVO = CompanyAttachVO.builder().bizNo(bizNo).atchType("PROD").build();
        List<CompanyAttachVO> prodImageList = this.companyAttachMapper.list(attachVO);

        // 홍보 이미지 추출
        attachVO.setAtchType("PRMT");
        List<CompanyAttachVO> prmtImageList = this.companyAttachMapper.list(attachVO);

        // JSON 변환
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String jsonProdImageList = gson.toJson(prodImageList);
        String jsonPrmtImageList = gson.toJson(prmtImageList);

        company.setProdImageList(prodImageList);
        company.setPrmtImageList(prmtImageList);
        company.setJsonProdImageList(jsonProdImageList);
        company.setJsonPrmtImageList(jsonPrmtImageList);

        return company;
    }

    /**
     * 참여회사 리스트 추출.
     * @return
     * @throws Exception
     */
    @Override
    public List<CmpMemberVo> list() throws Exception {
        // 파라미터 생성
        CmpMemberVo cmpMemberVo = CmpMemberVo.builder()
                        .mem_cd("M302")
                        .build();
        // 데이터 추출 및 반환
        return this.companyMapper.list(cmpMemberVo);
    }

    /**
     * 참여회사 등록.
     * @param cmpMemberVo
     * @return
     * @throws Exception
     */
    @Override
    public int create(CmpMemberVo cmpMemberVo) throws Exception {
        return 0;
    }

    /**
     * 참여회사 정보 수정
     * @param cmpMemberVo
     * @throws Exception
     */
    @Override
    public void update(CmpMemberVo cmpMemberVo) throws Exception {
        // 유효성 검사
        if (cmpMemberVo == null) {
            throw new Exception("인수로 전달된 cmpMemberVo가 null입니다.");
        }
        if (StringUtils.isBlank(cmpMemberVo.getBizNo())) {
            throw new Exception("bizNo 값이 빈값이거나 null입니다.");
        }

        try {

            // JSON 처리용 Gson
            Gson gson = new Gson();
            Type listType = new TypeToken<List<CompanyAttachVO>>(){}.getType();

            // 사업자번호 추출
            String bizNo = cmpMemberVo.getBizNo();

            // 로고 이미지 정보 처리
            String jsonLogoImage = cmpMemberVo.getJsonLogoImage();
            if (!StringUtils.isBlank(jsonLogoImage)) {
                // HTMLTagFilter 적용 되돌리기
                jsonLogoImage = HtmlTagUtils.restore(jsonLogoImage);
                List<CompanyAttachVO> logoAttachs = gson.fromJson(jsonLogoImage, listType);
                // 아이고야... 로고 이미지 처리하기 힘드네...
                if (logoAttachs != null && logoAttachs.size() > 0) {
                    cmpMemberVo.setLogoImgPath(logoAttachs.get(0).getSavedFilepath());
                }
            }

            // 주요생산품 이미지 처리
            // 우선 기존 데이터를 지운다.
            CompanyAttachVO deleteVo = CompanyAttachVO.builder().bizNo(bizNo).atchType("PROD").build();
            companyAttachMapper.delete(deleteVo);
            // 새로운 데이터를 등록한다.
            String jsonProdImageList = cmpMemberVo.getJsonProdImageList();
            if (!StringUtils.isBlank(jsonProdImageList)) {
                List<CompanyAttachVO> prodImageList = gson.fromJson(HtmlTagUtils.restore(jsonProdImageList), listType);
                for (CompanyAttachVO atch : prodImageList) {
                    atch.setBizNo(bizNo);
                    atch.setAtchType("PROD");
                    companyAttachMapper.create(atch);
                }
            }

            // 홍보 이미지 처리
            // 기존 데이터 삭제 처리
            deleteVo.setAtchType("PRMT");
            companyAttachMapper.delete(deleteVo);
            // 새로운 데이터 등록
            String jsonPrmtImageList = cmpMemberVo.getJsonPrmtImageList();
            if (!StringUtils.isBlank(jsonPrmtImageList)) {
                List<CompanyAttachVO> prmtImageList = gson.fromJson(HtmlTagUtils.restore(jsonPrmtImageList), listType);
                for (CompanyAttachVO atch : prmtImageList) {
                    atch.setBizNo(bizNo);
                    atch.setAtchType("PRMT");
                    companyAttachMapper.create(atch);
                }
            }

            // TODO : 삭제 대상 파일 삭제 처리 필요~

            this.companyMapper.update(cmpMemberVo);
        }
        catch (Exception ex) {
            LOGGER.error(ex.getMessage(), ex);
            throw ex;
        }
    }

    /**
     * 참여회사 삭제 처리
     * @param bizNo
     * @throws Exception
     */
    @Override
    public void delete(int bizNo) throws Exception {

    }
}
