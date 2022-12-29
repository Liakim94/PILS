클라우드 전환 내용
==================

### 1. 데이터베이스 전환

* 기존 Application을 클라우드 환경으로 전환하기 위하여 MySql 데이터베이스에서 Open Source 
  데이터베이스인 PostgreSQL로 전환하였다.
* 데이터베이스의 효율적인 이용을 위한 Connection pool을 DBCP를 이용하여 적용하였다.   
  (https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte:psl:data_source)

### 2. 파일 첨부 전환

* 클라우드 환경에서는 Application이 여러 인스턴스로 실행될 수 있어 각 인스턴스별로 파일을 관리하는 
  것은 문제가 있으므로, 각 인스턴스가 공동으로 접근 가능한 NAS를 이용한다.
* NAS 서버는 기정원 클라우드에서 제공하는 FreeNAS와 Minio를 이용한다.
* NAS에 대한 접근은 S3 API, Minio API 등을 이용하여 구현하였다.
* 별도 제공되는 FileService 라이브러리를 이용한다.   
  (http://gitlab.paas.smes-tipa.go.kr/wildrain/fileservice)

### 3. Session 공유 

* 클라우드 환경에서 Application이 여러 인스턴스로 실행 중일 때, Session을 공유하지 않으면 로그인 등 
  문제가 발생한다.
* Application의 각 인스턴스들의 Session을 공유하기 위하여 PaaS-TA에서 제공하는 Redis 서버를 이용하며, 
  spring-redis-session 라이브러리를 적용 하였다. 

### 4. EMS, UMS 전환

* 이메일 발송 및 SMS 발송 처리는 기정원에서 제공하는 EMS 및 UMS 시스템을 이용하도록 전환하였다.
* 별도 제공되는 Ums, Ems 라이브러리 이용한다.   
  (http://gitlab.paas.smes-tipa.go.kr/wildrain/ems, http://gitlab.paas.smes-tipa.go.kr/wildrain/ums)

### 5. 중소벤처24 서브 도메인 적용 및 표준 UI 적용

* 중소벤처24 하위의 서브 도메인(https://www.smes.go.kr/cobiz) 로 전환하였다.
* 중소벤처24 표준 UI를 적용하였다.

개발 환경 구축
==============

### 1. Maven Local Repository 구축

> __※ 폐쇄망이 아닌 경우 이 단계는 필요하지 않다.__

> * 외부 인터넷에 연결되어 있지 않은 폐쇄망에서 Maven Project를 빌드하기 위한 Maven Local Repository를 
>   별도로 제공한다.
> * 별도로 제공된 Maven Local Repository에는 offine 빌드에 필요한 모든 라이브러리 및 플러그인이 포함
>   되어 있다.
> * 별도 제공된 Maven Local Repository를 이용하여 폐쇄망에서 빌드시에는, 빌드 옵션으로 offline을 
>   설정하여야 한다.   
>   (참조 : https://hjjungdev.tistory.com/100, https://www.baeldung.com/maven-offline)

<!--※ 별도 제공된 Maven Repository를 개발 PC에 복사한다.-->

1. http://s3.paas.smes-tipa.go.kr:19016 에 접속하여 __/share/인수인계/.m2.zip__ 파일을 다운로드 한다.
* http://s3.pass.smes-tipa.go.kr:19016 을 통하여 제공하는 .m2.zip 파일에는 offline 빌드에 필요한 모든 
  라이브러리가 포함되어있다.

2. 개발용 PC의 __C:\Users\사용자폴더__ 위치에 .m2.zip 파일의 압축을 푼다.
* 압축 해제된 폴더의 구조는 아래와 같다.
  
  ```
  C:\Users\사용자폴더
    |
    +-- .m2
          | 
          +-- repository
          |
          +-- settings-offline.xml
  ```

### 2. 전자정부 표준프레임워크 개발 환경 구축

<!-- __※ 폐쇄망이 아닌 경우 이단계는 필요하지 않다.__ -->

1. 전자정부 표준프레임워크 포털 사이트 (https://www.egovframe.go.kr)에서 '개발자용 개발환경 3.8'을 
   다운로드 받아 설치하거나 별도 제공하는 eGovFrameDev-3.8.0-64bit.zip을 다운로드 하여 설치한다.
  
> 전자정부 표준프레임워크 포털 사이트에서 개발자용 개발환경을 다운로드하여 설치하는 경우, 환경 설정등
> 작업이 번거롭고, Maven Offline 빌드 등에서 오류가 발생 할 수 있으므로, 유지보수를 위해서는 별도 제공
> 하는 eGovFrameDev-3.8.0-64bit.zip을 다운 받아 이용하는것을 권장한다.

> 아래부터는 별도 제공하는 eGovFrameDev-3.8.0-64bit.zip을 다운 받아 이용하는 방법을 설명한다.

2. eGovFrameDev-3.8.0-64bit.zip 다운로드 및 설치

* http://s3.paas.smes-tipa.go.kr:19016 에 접속하여 __/share/인수인계/eGovFrameDev-3.8.0-64bit.zip__ 
  파일을 다운로드 한다.
* 개발용 PC의 C:\ 위치에 eGovFrameDev-3.8.0-64bit.zip 파일의 압축을 푼다.
* 압축 해제된 폴더의 구조는 아래와 같다.
  
  ```
  C:\
    |
    +-- eGovFrameDev-3.8.0-64bit
          |
          +-- eclipse
          |
          +-- workspace
                | 
                +-- bizlink-git       → 비즈니스지원단 소스
                |
                +-- cobiz-git         → 협업정보시스템 소스
                |
                +-- csr-git           → CSR 사외적책임경영 소스
                |
                +-- ems-git           → ems client 소스
                |
                +-- fileservice-git   → fileservice client 소스
                |
                +-- mna-git           → M&A 거래정보망 소스
                |
                +-- Servers
                |
                +-- ums-git           → ums client 소스
  ```

3. 이클립스 실행 및 Maven offline 설정

* C:\eGovFrameDev-3.8.0-64bit\eclipse\eclipse.exe를 실행한다.
* 이클립스 Window → Preperences 메뉴를 선택한다.
* Maven 화면에서 Offline을 선택하고 저장한다.

  <img alt="vpn 접속이 필요합니다." src="http://gitlab.paas.smes-tipa.go.kr/wildrain/csr/uploads/ae2b72e996960ce403aecd5d72263d55/Preferences_Maven.PNG" width="500px" />

* Maven → User Settings 화면에서 User Settings 파일을 
  C:\Users\사용자ID\\.m2\\settings-offline.xml을 선택하고 저장한다.

  <img alt="vpn 접속이 필요합니다." src="http://gitlab.paas.smes-tipa.go.kr/wildrain/csr/uploads/5eefe3754f9b1c727ab7d62d78c9c1b0/Preferences_Maven_User_Settings.PNG" width="500px" />

4. Maven offline 빌드 테스트

* Maven update
  * 이클립스 Project Explorer 등에서 cobiz-git 프로젝트를 선택.
  * 마우스 오른쪽 버튼 클릭 후 Maven → Update Project 클릭.   
    (Offline이 선택되어 있지 않다면 아래 그림과 같이 선택!)
    
    <img alt="vpn 접속이 필요합니다." src="http://gitlab.paas.smes-tipa.go.kr/wildrain/csr/uploads/e1f3ce6513b6a5f6649fdfaaebffc2e1/Maven_Update_Project.PNG" width="500px" />

  * 오류 없이 프로세스가 종료되었다면 통과.
  
* Maven Install
  * 이클립스 Project Explorer 등에서 cobiz-git 프로젝트를 선택.
  * 마우스 오른쪽 버튼 클릭 후 Run As → Maven Install 클릭.
  * 오류 없이 프로세스가 종료(SUCCESS) 되었다면 통과.


### 3. Redis 서버 설치

> 클라우드 환경에서 개발용으로 사용할 수 있는 Redis 서버가 존재하지 않으므로 로컬 PC에 Redis 서버를 
  설치하여 개발용으로 이용한다.

1. Windows 용 Redis 서버 설치
* https://goni9071.tistory.com/473 페이지를 참조하여 Windows 용 Redis 서버를 설치한다.
    
2. 비밀번호 및 외부 접속 허용 설정
- Windows Redis server의 경우 redis-windows-service.conf 파일을 수정해햐 한다.
- 비밀번호 설정 : requirepass <비밀번호> 지정
- 외부접속 설정 : bind 0.0.0.0 추가 지정 등(외부접속이 필요 없을 경우 아래 예시와 같이 127.0.0.1을 유지)
- 예시
  
  ```shell
  ...
  bind 127.0.0.1
  ...
  requirepass rkfaorl999
  ...
  ```
  
3. Redis Server Service 등록
* 서비스 등록, 삭제, 서버 시작, 중지 명령은 아래와 같다.
  ```shell
  redis-server --service-install redis.windows.service.conf --loglevel verbose
  
  redis-server --service-uninstall
  
  redis-server --service-start
  
  redis-server --service-stop
  ```
  
### 4. 데이터베이스 설치

* 필요하다면 자체 데이터베이스 서버를 설치하여 사용할 수 있지만 번거로운 작업이므로  
  클라우드 환경의 개발 데이터베이스를 이용하여 개발한다. 
  (단, 로컬에서 실행시 VPN에 접속되어있어야 한다.)
  
* 데이터베이스 접속 정보는 아래와 같다.
  <table>
    <thead>
      <tr><th>구분</th><th>ip:port</th><th>데이터베이스</th><th>비고</th></tr>
    </thead>
    <tbody>
      <tr><td>운영DB</td><td>(10.0.201.141:10001)<br/>172.0.201.1:15432</td><td>cobiz</td><td></td></tr>
      <tr><td>개발DB</td><td>(10.0.201.149:10001)<br/>172.0.201.32:15432</td><td>cobiz</td><td>개발/테스트용으로 이용</td></tr>
    </tbody>
  </table>

### 5. NAS 설치

* 현재 클라우드 환경에서 파일 첨부는 FreeNAS와 minio를 이용하여 처리하므로 
  FreeNAS 및 minio의 설치가 필요하지만, 역시 번거로운 작업이므로 클라우드 환경의 FreeNAS를 
  이용하여 개발한다. (단, 로컬에서 실행시 VPN에 접속되어있어야 한다.)

* NAS 접속 정보는 아래와 같다.   
  ※ NAS 서버는 별도로 개발서버를 제공하지 않으므로 bucket을 이용하여 운영/개발을 구분한다.   
  (운영과 개발의 end point가 다르지만 동일한 서버이다)
  
  <table>
    <thead>
      <tr><th>구분</th><th>end point</th><th>bucket</th><th>비고</th></tr>
    </thead>
    <tbody>
      <tr><td>운영</td><td>http://172.0.132.51:20000</td><td>cobiz</td><td>클라우드 내부 접속용 IP</td></tr>
      <tr><td>개발</td><td>http://s3.paas.smes-tipa.go.kr:19001</td><td>cobiz-dev</td><td>클라우드 외부 접속용 IP, 개발/테스트용으로 이용</td></tr>
    </tbody>
  </table>



개발 실행 환경 설정  
================

> * spring.profiles.active 속성을 이용하여 각 실행 환경별로 properties를 구분한다.
> * tomcat 서버의 vm option에 -Dspring.profile.active=dev를 추가하여 
  클라우드 개발환경을 이용하여 실행하도록 한다.

### 1. 개발 운영 환경별 설정

* vm option에 -Dspring.profiles.active를 설정하여 구분한다.
  <table>
  <thead>
    <tr>
      <th>구분</th>
      <th>manifest</th>
      <th>vm option</th>
      <th>properies</th>
      <th>비고</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>클라우드 운영 배포</td>
      <td>manifest-cloud.yml</td>
      <td>-Dspring.profiles.active=cloud</td>
      <td>globals.properties<br/>globals-cloud.properties</td>
      <td>www.smes.go.kr/cobiz 배포</td>
    </tr>
    <tr>
      <td>클라우드 개발 배포</td>
      <td>manifest-cloud-dev.yml</td>
      <td>-Dspring.profiles.active=cloud-dev</td>
      <td>globals.properties<br/>globals-cloud-dev.properties</td>
      <td>www.smes.go.kr/cobiz-dev 배포</td>
    </tr>
    <tr>
      <td>로컬개발</td>
      <td></td>
      <td>-Dspring.profiles.active=dev</td>
      <td>globals.properties<br/>globals-dev.properties</td>
      <td>대전유지보수 개발환경 <br/>(SSL VPN 접속 필요)</td>
    </tr>
    <tr>
      <td>로컬개발</td>
      <td></td>
      <td>-Dspring.profiles.active=local</td>
      <td>globals.properties<br/>globals-local.properties</td>
      <td>서울사업장 개발 환경</td>
    </tr>
  </tbody>
  </table>

### 2. 유지보수를 위한 로컬 실행 환경 설정 및 Application 실행

> * 개발용 PC에 tomcat 9.x 이상이 설치 되어있어야 한다.
> 

1. Application 실행을 위한 Server를 추가한다.
* Project에서 마우스 오른쪽 클릭 → Run As →  Run on Server를 선택하여 Server를 추가하거나
* Servers 뷰에서 마우스 오른쪽 클릭 → New → Server를 선택하여 Server를 추가한다.
2. tomcat server VM_OPTION 설정
* 개발용 PC에서 이클립스 등을 이용하여 서버를 실행하는 경우 해당 서버의 vm option에
  아래 이미지와 같이 __-Dspring.profiles.active=dev__ 를 추가한다.
  
  <img alt="vpn 접속이 필요합니다." src="http://gitlab.paas.smes-tipa.go.kr/wildrain/csr/uploads/d4adf72994504f61a31088e1085efb13/Edit_Configuration.PNG" width="500px" />

3. 구성된 서버를 실행한다.
* Project에서 마우스 오른쪽 클릭 → Run As → Run on Server를 선택하여 Server를 실행하거나
* Servers 뷰에서 Start한다.

> -Dspring.profiles.active=dev 설정에 의하여 
> Application 실행 시, 프로퍼티 파일은 globals.properties와 globals-dev.properties 파일이 사용 되며,   
> globals-dev.properties 파일에 의하여 데이터베이스, NAS, Redis 정보가 아래 표와 같이 설정된다. 
>   <table>
>   <thead><tr><th>구분</th><th>사용값</th><th>비고</th></tr></thead>
>   <tbody>
>   <tr><td>데이터베이스</td><td>jdbc:postgresql://10.0.201.149:1001/cobiz</td><td>클라우드 개발</td></tr>
>   <tr><td>NAS</td><td>http://s3.paas.smes-tipa.go.kr:19001<br/>(http://10.0.201.182:19001)</td><td>클라우드 운영 (cobiz-dev 버킷 사용)</td></tr>
>   <tr><td>Redis</td><td>127.0.0.1:6379</td><td>로컬 개발PC</td></tr>
>   </tbody>
>   </table>

클라우드 배포
=============

> Cloud Foundry CLI를 이용하여 배포하므로 Cloud Foundry CLI가 설치되어 있어야 하며, cf login 후 
> 처리한다.    
> (설치 및 로그인 방법은 cf cli 가이드 참조)

### 1. 개발/테스트 배포 (www.smes.go.kr/cobiz-dev)

* Application 개발/수정 완료 후 운영서버에 적용하기 전에 최종 테스트를 위하여 개발 및 테스트를 위한 
  배포를 실시한다.
* 테스트를 위한 배포는 https://www.smes.go.kr/cobiz-dev 경로로 배포하며, manifest-cloud-dev.yml 파일을 
  이용하여 배포한다.

```shell
cf push cobiz-dev -f manifest-cloud-dev.yml
```

### 2. 운영 배포 (www.smes.go.kr/cobiz)

* https://www.smes.go.kr/cobiz-dev 에 배포하여 테스트 후 이상이 없것을 확인하고 실제 운영 배포를 
  실시한다.
* 운영을 위한 배포는 https://www.smes.go.kr/cobiz 경로로 배포하며, manifest-cloud.yml 파일을 이용하여 
  배포한다.

```shell
cf push cobiz -f manifest-cloud.yml
```