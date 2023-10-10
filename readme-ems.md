EmsClient를 이용한 메일 발송
============================

> 중소벤처24 포털에서 제공하는 EMS 시스템을 이용하여 이메일을 발송하기 위해서는 EMS 시스템에서 제공하
> 는 API를 호출하여야 한다. 본 프로젝트는 해당 API를 캡슐화하여 구현하였다.   
> (Ems 전송요청 API에 대한 자세한 사항은 document 폴더의 문서를 확인한다.)

### 1. Maven Install

* 본 프로젝트의 EmsClient를 적용하려면, 먼저 본 프로젝트를 Maven Local Repository에 install 한다.
* 먼저 본 프로젝트 소스를 다운 받는다.

```shell
git clone http://gitlab.paas.smes-tipa.go.kr/wildrain/ems2.git
```

* Maven Install 실행

```shell
cd ems2
mvn clean 
mvn install -Dskip.tests
```

* C:\Users\[사용자폴더]\\.m2\repository\kr\go\smes\ems\0.2.1-SNAPSHOT 생성을 확인한다.


### 2. pom.xml에 Dependency 추가

* EmsClient를 사용하고자하는 프로젝트의 pom.xml에 아래와 같이 dependency를 추가한다.

```xml
<dependency>
    <groupId>kr.go.smes</groupId>
    <artifactId>ems</artifactId>
    <version>0.2.1-SNAPSHOT</version>
</dependency>
```

### 3. Bean 등록

* 먼저 properties 파일에 중소벤처24 포털에서 제공하는 Ems 시스템과 연동을 위한 정보를 설정한다.
* 아래는 예제이므로 각 시스템에 맞게 설정하여야 한다.

```properties
Ems.LinkName        = csr
Ems.TargetUrl       = http://172.0.128.141:10060/api/sendMail.do
Ems.DefaultFrom     = webmaster@csr.go.kr
Ems.DefaultCategory = 전체공지
```

* 각각의 프로퍼티 항목은 아래 표에서 설명한다.

| Key | Value | 비고 |
| --- | --- | --- |
| Ems.LinkName | 중소벤처24 포털 Ems 시스템에 등록되어있는 연결 시스템 명 | 필요 시, 중소벤처24 포털 Ems 시스템에 등록 요청 할것! |
| Ems.TargetUrl | http://172.0.128.141:10060/api/sendMail.do | 중소벤처24 포털 Ems 발송 API 경로 |
| Ems.DefaultFrom | 발송자 이메일주소 기본값 |   |
| Ems.DefaultCategory | 전체공지 | 중소벤처24 포털 Ems 시스템에 등록되어있는 카테고리. |

* context-common.xml 등에 아래와 같이 emsClient를 Bean으로 등록한다.
```xml
<bean id="emsClient" class="kr.go.smes.ems.SmesEmsClient">
    <constructor-arg name="linkName" type="java.lang.String" value="${Ems.LinkName}" />
    <constructor-arg name="targetUrl" type="java.lang.String" value="${Ems.TargetUrl}" />
    <constructor-arg name="defaultFrom" type="java.lang.String" value="${Ems.DefaultFrom}" />
    <constructor-arg name="defaultCategory" type="java.lang.String" value="${Ems.DefaultCategory}" />
</bean>
```


**※ 로컬 개발 테스트**

* 172.0.128.141 서버는 NAT Gateway 서버로 클라우드 망 내부에서만 접근이 가능하다.
* 따라서 개발자의 개발 PC에서 실행 시 접근이 불가능하여 오류가 발생할 수 있다.
* 개발 PC에서 실행 시에는 아래와 같이 개발용으로 제공하는 MockEmsClient를 이용하여 실행한다.

```xml
<bean id="emsClient" class="kr.go.smes.ems.MockEmsClient">
    ...
</bean>
```

### 4. Email 발송

* 등록된 Bean을 이용하여 메일을 발송한다.
* 아래는 SmesEmsClient를 이용한 메일 발송 예제이다.

```java
@Controller
public class EmsTestController {

    @Autowired
    private EmsClient emsClient;

    @RequestMapping(value = "/user/emstest/test.do")
    public void send(HttpServletResponse response) {
        try {

            EmsResponse result = emsClient.send("wildrain@kaoni.com", "클라우드 이메일 발송 테스트", "클라우드 이메일 발송 테스트");

            String status = result.isSuccess() ? "SUCCESS" : "FAIL";

            PrintWriter printWriter = response.getWriter();
            printWriter.println("<html><head><title>SmsTest Result!</title></head><body><h1>" + Encode.forHtml(status) + "</h1><h2>" + Encode.forHtml(result.getErrorCode()) + "</h2></body></html>");
            printWriter.flush();
            printWriter.close();

        }
        catch (Exception ex) {
            String message = ex.getMessage();
            try {
                PrintWriter printWriter = response.getWriter();
                printWriter.println("<html><head><title>FAIL!</title></head><body><h1>" + Encode.forHtml(message) + "</h1></body></html>");
                printWriter.flush();
                printWriter.close();
            }
            catch (Exception exx) {
                exx.printStackTrace();
            }
        }
    }
}
```


### 5. 발송 결과

* 메일 발송 결과는 EmsResponse 객체로 반환된다.

```java
    /** 전송 결과. 성공 시 true, 오류, 실패 시 false */
    private boolean status;

    /**
     * 전송 실패 시 오류 코드.
     * NOT_ENOUGH_DATA      : 필수값 부족
     * CATEGORY_ERROR       : 미등록 분류
     * LINK_ERROR           : 미등록 연계 시스템
     * RESERVER_TIME_ERROR  : 전송시간 오류
     * FROM_MAIL_EMPTY      : 보내는 메일주소 누락
     * TO_MAIL_EMPTY        : 받는 메일주소 누락
     * SUBJECT_EMPTY        : 제목 누락
     * CONTENT_EMPTY        : 내용 누락
     * CATEGORY_EMPTY       : 분류 누락
     */
    private String errorCode;
```

## 6. Reference

### 6.1. EmsRequest

*   properties vs API parameter (EMS전송요청API_티젠.hwp참조)

| Properties | 길이 | 필수여부 | 설명 | 비고(API 파라미터) |
| --- | --- | --- | --- | --- |
| subject | 100 | 필수 | 메일 발송 제목 | title |
| content | CLOB | 필수 | 메일 발송 내용 | content |
| from | 100 | 필수 | 발송자 정보(이메일 주소) 이메일 주소와 이름 띄어쓰기로 구분<br> ex) admin@smes.go.kr <br>관리자 발신자 이메일 필수 | sendInfo |
| to | 100 | 필수 | 수신자 정보(이메일 주소) <br>이메일 주소와 이름 띄어쓰리고 구분 <br>수신자 이메일 필수 | rcvInfo |
| reserveTime | 14 |   | 메일 전송 시간(yyyyMMddHHmmss) <br>EmsClient에서는 reserveTime이 빈값이라면 즉시전송(D)로 설정하고 빈값이 아니라면 예약전송(R)처리 함. | sendDate |
| category | 100 |   | 메일 분류 값 <br>- 현재 **전체공지 / 개별공지 / 회원가입** 코드 존재. <br>**알림** 코드 추가하여 기본값으로 이용. | categoryName |
| linkName | 100 | 필수 | 시스템 고유 구분 값 - API 전송시 필수 | linkNm |

### 6.2. EmsResponse

*   ErrorCode

| CODE | 오류 내용 | 비고 |
| --- | --- | --- |
| NOT_ENOUGH_DATA | 필수값 부족 |   |
| CATEGORY_ERROR | 미등록 분류 |   |
| LINK_ERROR | 미등록 연계 시스템 |   |
| RESERVER_TIME_ERROR | 전송시간 오류 |   |
| FROM_MAIL_EMPTY | 보내는 메일주소 누락 | from, defaultFrom 모두 빈값일 때 |
| TO_MAIL_EMPTY | 받는 메일주소 누락 | to가 빈값일 때 |
| SUBJECT_EMPTY | 제목 누락 | subject가 빈값일 때 |
| CONTENT_EMPTY | 내용 누락 | content가 빈값일 때 |
| CATEGORY_EMPTY | 분류 누락 | category, defaultCategory 모두 빈값일 때 |