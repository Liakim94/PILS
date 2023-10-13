package kr.co.xicom.front.model;

import com.google.gson.annotations.SerializedName;
import lombok.*;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.util.List;

@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BannerVO extends DefaultVO{
    private String banSeq ="";
    private String banNm ="";
    private String siteUrl ="";
    /** 상태값 (사용여부) */
    private Integer stts =0;

    /** 정렬 순서 */
    private Integer sortSeq =0;

    /** 등록 일시 */
    private String registDt ="";
    /** 수정 일시 */
    private String upDt ="";

    /** 오리지널 파일 명 */
    @SerializedName("name")
    private String fileNm;

    /** 파일 사이즈 */
    @SerializedName("size")
    private Integer fileSize;

    /** 파일 Mime-type */
    @SerializedName("type")
    private String fileType;

    /** 파일 저장 경로 */
    private String savedPath;

    /** 파일 저장 명 */
    private String savedFileName;

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

    /**
     * FileUploader.js에 의해 삭제된 파일 리스트 (JSON 문자열)
     */
    private String jsonDeletedFileList;

    private String  fileStd					= "";  // 첨부파일 규격
    /**
     * banner 저장 경로
     */
    private String pcImgPath;
    private String mobileImgPath;

//    /**
//     * banner 오리지널 파일명
//     */
//    private String logoFileName;

    /**
     * banner 파일정보 (JSON 문자열)
     */
    private String jsonPcImage;
    private String jsonMobileImage;

}
