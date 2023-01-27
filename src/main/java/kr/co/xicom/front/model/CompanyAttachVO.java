package kr.co.xicom.front.model;

import com.google.gson.annotations.SerializedName;
import lombok.*;
import org.apache.commons.lang3.StringUtils;

import java.io.File;
import java.sql.Timestamp;

/**
 * 참여 회사 첨부파일 VO.
 */
@Getter
@Setter
@ToString
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CompanyAttachVO {

    /** 첨부파일 일련번호 */
    private Integer cmpAtchSeq;

    /** 오리지널 파일 명 */
    @SerializedName("name")
    private String fileName;

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

    /** 첨부 유형
     *  PROD : 주요생상품 이미지
     *  PRMT : 홍보 이미지
     *  ATTACH : 첨부파일
     */
    private String atchType;

    /** 사업자 번호 */
    private String bizNo;

    /** 비디오 URL */
    private String videoUrl;

    /** 등록 일시 */
    private Timestamp registDate;

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
