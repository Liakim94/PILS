
## VM Option 지정

> 로컬 PC에서 개발시 아래 옵션을 지정
>
* -Dfile.encoding=utf-8
* -Dspring.profiles.active=local
* -Djava.net.preferIPv4Stack=true → IPv4로 ip 출력. ※ 클라우드 배포시 적용 필요

-------------------------------------------------------------------------------

데이터베이스
============

## 서울사업장 개발 데이터베이스

| IP | Port | db name | user id | password | 비고 |
|----|------|---------|---------|----------|------|
| 192.168.0.31 <br/>(1.234.242.228) | 5432<br/>(15432) | pis | pis | 1234 | 로컬 개발용 |


## 클라우드 개발 데이터베이스

| IP | Port | db name | user id | password | 비고 |
|----|------|---------|---------|----------|------|
| 10.0.201.154 <br/>172.0.201.51(LB)<br/>172.0.201.52(DB) | 10001<br/>(15432) | pis | pis | 1234 | www.smes.go.kr/pis-dev 테스트용 |


## 클라우드 운영 데이터베이스

| IP | Port | db name | user id | password | 비고 |
|----|------|---------|---------|----------|------|
| 10.0.201.144<br/>172.0.201.13(LB)<br/>172.0.201.14(Active)<br/>172.0.201.15(Standby) | 10001<br/>(15432) | pis | pis | pis!@# | PostgreSQL 11.7<br/> CentOS 7.8|
| 상동   | 상동     | experdb | experdba | experdba | 데이터베이스 관리 계정  |

-------------------------------------------------------------------------------

NAS
===

| IP | Port | Access Key | Secret Key | 비고 |
|----|------|------------|------------|------|
| 172.0.131.7 (LB)<br/>172.0.132.52<br/>172.0.132.53 | 19020 | pis | skqvna1! | s3.paas.smes-tipa.go.kr:19020 |

-------------------------------------------------------------------------------

클라우드 서버 정보
==================

| 항목 | 내용 | 비고 |
|------|------|------|
| OS   | Ubuntu 18.04.2 LTS | |
| JDK  | OpenJDK 1.8.0_232  | |
| WAS  | tomcat 9.0.27.0    | |

* 버전확인 Script
```shell
# OS 버전확인
cat /etc/*release*

# JDK 버전 확인
~/app/.java-buildpack/open_jdk_jre/bin/java -version

# WAS 버전 확인
~/app/.java-buildpack/open_jdk_jre/bin/java -cp catalina.jar org.apache.catalina.util.ServerInfo
```

-------------------------------------------------------------------------------