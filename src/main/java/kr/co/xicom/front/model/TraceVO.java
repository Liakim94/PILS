package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;

import java.io.File;

@Getter
@Setter
public class TraceVO extends DefaultVO {
    private int seq = 0; //고유번호
    private String title =""; //제목
    private String cont =""; //내용
    private String rgst_dt="";//등록일자
    /**
     * 대표 이미지 경로
     */
    private String imgPath;
    /**
     * FileUploader.js에 의해 업로드된 파일 리스트 (JSON 문자열)
     */
    private String jsonFileList;
    /**
     * FileUploader.js에 의해 삭제된 파일 리스트 (JSON 문자열)
     */
    private String jsonDeletedFileList;

    private String file_path;
    private String saved_file_nm;
    private String file_nm;

    public String getSavedFilePath() {
        if (!StringUtils.endsWith(this.file_path, File.separator)) {
            this.file_path = this.file_path + File.separator;
        }
        return this.file_path + this.saved_file_nm;
    }
}
