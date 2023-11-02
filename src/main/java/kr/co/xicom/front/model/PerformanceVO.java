package kr.co.xicom.front.model;

import com.google.gson.annotations.SerializedName;
import lombok.*;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.nio.charset.StandardCharsets;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PerformanceVO extends DefaultVO{
    private Integer seq;
    private String cmp_nm ="";  //
    private String cntr_pd ="";
    private Integer cntr_numb;
    private Integer cmp_numb;
    private String regist_dt ="";
    private String user_id ="";
    /**
     * 파일 경로
     */
    private String intrlck ="";   //연동표
    private String change ="";
    private String intrlck_perf ="";
    private String etc ="";
    /**
     * 원본파일이름
     */
    private String intrlck_file_nm ="";   //연동표
    private String change_file_nm ="";
    private String intrlck_perf_file_nm ="";
    private String etc_file_nm ="";
    /**
     * 파일정보 (JSON 문자열)
     */
    private String jsonIntrlckFile ="";
    private String jsonChangeFile ="";
    private String jsonIntrlckPerfFile ="";
    private String jsonEtcFile ="";


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

    /**
     * FileUploader.js에 의해 업로드된 파일 리스트 (JSON 문자열)
     */
    private String jsonFileList;

    /** 다운로드 파일명 변경*/
    public void setIntrlckDownloadFileNm(String cmp_nm) {
        String fileExtension = FilenameUtils.getExtension(this.intrlck_file_nm);
        this.intrlckDownloadFileNm = "(연동표)_"+cmp_nm+ "."+ fileExtension;
    }
    public void setChangeDownloadFileNm(String cmp_nm) {
        String fileExtension = FilenameUtils.getExtension(this.change_file_nm);
        this.changeDownloadFileNm = "(변동표)_" + cmp_nm+ "."+ fileExtension;
    }
    public void setIntrlckPerfDownloadFileNm(String cmp_nm) {
        String fileExtension = FilenameUtils.getExtension(this.intrlck_perf_file_nm);
        this.intrlckPerfDownloadFileNm = "(연동실적)_" + cmp_nm+ "."+ fileExtension;
    }
    public void setEtcDownloadFileNm(String cmp_nm) {
        String fileExtension = FilenameUtils.getExtension(this.etc_file_nm);
        this.etcDownloadFileNm = "(기타)_" + cmp_nm+ "."+ fileExtension;
    }
    private String intrlckDownloadFileNm;
    private String changeDownloadFileNm;
    private String intrlckPerfDownloadFileNm;
    private String etcDownloadFileNm;

    private String tag="";
    private String keyword="";
    private String nm="";  //담당자 이름

}
