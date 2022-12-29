Database Connection Pool 설정
=============================

### 1. dependency 추가 

* pom.xml에 dbcp 의존성을 추가한다.
```xml
<dependency>
    <groupId>commons-dbcp</groupId>
    <artifactId>commons-dbcp</artifactId>
    <version>1.3</version>
</dependency>
```

### 2. context-datasource.xml 수정

* 기존에 적용된 org.springframework.jdbc.datasource.DriverManagerDataSource를 아래와 같이 org.apache.commons.dbcp.BasicDataSource로 변경한다.
```xml
<bean id="dataSource-postgreSql" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
    <property name="driverClassName" value="${Globals.DriverClassName}"/>
    <property name="url" value="${Globals.Url}"/>
    <property name="username" value="${Globals.Username}"/>
    <property name="password" value="${Globals.Password}"/>
    <property name="initialSize" value="${Globals.initialSize}"/>
    <property name="maxActive" value="${Globals.maxTotal}"/>
    <property name="maxIdle" value="${Globals.maxIdle}"/>
    <property name="minIdle" value="${Globals.minIdle}"/>
    <property name="maxWait" value="${Globals.maxWaitMillis}"/>
</bean>
```

### 3. properties 파일 수정

* properties 파일에 Database Connection Pool 관련 프로퍼티를 추가한다.
```
Globals.initialSize     = 32
Globals.maxTotal        = 32
Globals.maxIdle         = 32
Globals.minIdle         = 32
Globals.maxWaitMillis   = 3000
```

### ※ 참조
* https://www.egovframe.go.kr/wiki/doku.php?id=egovframework:rte:psl:data_source
* https://sjh836.tistory.com/148
* https://linked2ev.github.io/spring/2019/08/14/Spring-3-%EC%BB%A4%EB%84%A5%EC%85%98-%ED%92%80%EC%9D%B4%EB%9E%80/
