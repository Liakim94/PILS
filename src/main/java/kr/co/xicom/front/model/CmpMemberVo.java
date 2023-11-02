package kr.co.xicom.front.model;

import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CmpMemberVo extends DefaultVO {

    private String bizNo = "";   //사업자번호
    private String bizNo1 = "";
    private String bizNo2 = "";
    private String bizNo3 = "";
    private String mem_cd = "";  //기업회원구분
    private String cmpNm = "";  //기업명
    private String fdate = "";  //설립일자
    private String ceo = "";    //대표자명
    private String address = "";
    private String address_dtl = "";
    private String telNo = "";
    private String faxNo = "";
    private String bizType = "";
    private int capital = 0;
    private String product = "";  //주요생산품
    private String conQ = "";
    private String deal_type = "";
    private String deal_scale = "";
    private String material = "";   //주요 원재료
    private String appdate = "";  //신청일자
    private String update = ""; //동행기업 수정일자
    private String id = "";
    private String passwd = "";
    private String name = "";
    private String deptNm = "";
    private String position = "";
    private String mbphno = "";
    private String email = "";
    private String email1 = "";
    private String email2 = "";
    private String memTelNo = "";
    private String memFaxNo = "";
    private String join_confm = ""; //가입승인여부
    private String join_dt = "";
    private String update_mem = "";
    private String delete_yn = ""; //삭제여부
    private String auth_cd = ""; //권한코드
    private String management_cd = ""; //담당자구분코드
    private int joinCmp =0; //참여기업
    private String mainProduct =""; //주요 적용 제품 & 수위탁거래 대상물품명
    private String bizcd=""; //업종구분코드

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
     * 메인 동영상 URL
     */
    private String mainMovieUrl;

    /**
     * 로고 이미지 저장 경로
     */
    private String logoImgPath;

    /**
     * 로그 이미지 오리지널 파일명
     */
    private String logoFileName;

    /**
     * 기업홍보 동영상 URL
     */
    private String subMovieUrl;

    /**
     * 로그 이미지 파일정보 (JSON 문자열)
     */
    private String jsonLogoImage;

    /**
     * 주요생산품 이미지 파일정보 리스트 (JSON 문자열)
     */
    private String jsonProdImageList;

    /**
     * 주요생산품 삭제된 이미지 파일정보 리스트 (JSON 문자열)
     */
    private String jsonDeletedProdImageList;

    /**
     * 홍보 이미지 파일정보 리스트 (JSON 문자열)
     */
    private String jsonPrmtImageList;

    /**
     * 삭제된 홍보 이미지 파일정보 리스트 (JSON 문자열)
     */
    private String jsonDeletedPrmtImageList;

    /** 주요생산품 이미지 리스트 */
    private List<CompanyAttachVO> prodImageList;

    /** 홍보 이미지 리스트 */
    private List<CompanyAttachVO> prmtImageList;

    //Do 추가 2023-08-23
    private String keyword ="";  //검색어
    private String tag ="";     //태그
    private String sort ="";  //정렬조건


}
