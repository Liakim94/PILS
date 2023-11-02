package kr.co.xicom.front.model;

import lombok.*;
import org.apache.commons.lang3.StringUtils;

import java.io.File;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ConsultingVO extends DefaultVO {

    private Integer seq;
    private String const_ty1 = "";   //신청분야(확인서발급)
    private String const_ty2 = "";   //신청분야(컨설팅)
    private String cmp_nm = "";  //기업명
    private String ceo = "";    //대표자명
    private String bizNo = "";   //사업자번호
    private String bizNo1 = "";
    private String bizNo2 = "";
    private String bizNo3 = "";
    private String regist_num = "";  //법인등록번호
    private String addr = "";
    private String addr_dtl = "";
    private String biz_ty = "";    //위탁/수탁 대상 여부
    private String product = "";  //거래 대상 물품명
    private String prmy_mat = "";   //주요 원재료 후보
    private String mem_nm = "";  //담당자명
    private String pstn = "";   //직위
    private String mbphno = "";   //담당자 연락처
    private String email = "";
    private String email1 = "";
    private String email2 = "";
    private String pswd = "";  //비밀번호
    private String regist_dt = ""; //등록일자
    /**
     * 오리지널 파일명
     */
    private String filenm1 = ""; //사업신청서&활용계획서
    private String filenm2 = ""; //사업자등록증&중소기업확인서
    private String filenm3 = ""; //개인 또는 법인(신용)정보 수집·이용·제공 조회 동의서
    private String filenm4 = ""; //국세&지방세 완납증명서
    /**
     * 저장 경로
     */
    private String filenm1_path = "";
    private String filenm2_path = "";
    private String filenm3_path = "";
    private String filenm4_path = "";

    /**
     * 파일정보 (JSON 문자열)
     */
    private String jsonFile1 ="";
    private String jsonFile2 ="";
    private String jsonFile3 ="";
    private String jsonFile4 ="";

    /**
     * FileUploader.js에 의해 업로드된 파일 리스트 (JSON 문자열)
     */
    private String jsonFileList;

    /** 파일 저장 경로 */
    private String savedPath;  //filePath

    /** 파일 저장 명 */
    private String savedFileName;   //svFileNm

    /** 저장 파일명을 포함한 전제 저장 파일 경로 반환 */
    public String getSavedFilepath() {
        String result = this.savedPath;
        if (!StringUtils.endsWith(result, File.separator)) {
            result += File.separator;
        }
        result += this.savedFileName;
        return result;
    }

}
