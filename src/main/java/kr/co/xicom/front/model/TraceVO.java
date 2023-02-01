package kr.co.xicom.front.model;

import lombok.Getter;
import lombok.Setter;

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
}
