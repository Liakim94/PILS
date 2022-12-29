Spring-redis-session을 이용한 session 공유
==========================================

> * 클라우드 환경에 app을 배포하기 위해서는 redis를 이용한 session 공유 처리가 되어있어야 한다.
> * session 공유 처리가 되어 있지 않은 경우 instance가 늘어나면 로그인 등 문제가 발생 함.

### 1. dependency 추가

* pme.xml에 아래의 dependency를 추가한다.
```xml
<dependency>
    <groupId>org.springframework.session</groupId>
    <artifactId>spring-session-data-redis</artifactId>
    <version>1.3.3.RELEASE</version>
</dependency>
<!-- lettuce -->
<dependency>
    <groupId>biz.paluch.redis</groupId>
    <artifactId>lettuce</artifactId>
    <version>3.5.0.Final</version>
</dependency>
```

### 2. property 추가
   
* 적당한 properties 파일에 아래의 property를 추가한다.

```properties
Redis.HostName  = 192.168.0.28      # redis 개발 서버
Redis.Port      = 6379              # redis 포트
Redis.Password  = rkfaorl999        # 비밀번호
Redis.Database  = 0                 # 데이터베이스 번호(생략 가능)
```

※ 192.168.0.28은 서울 사업장에 구축된 redis 개발서버 임<br>
※ 클라우드에 배포한 App에 적용할 값은 아래의 [Spring-redis-session 클라우드 적용] 참조.

### 3. context-redis.xml 추가

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/mvc http://www.springframework.org/schema/mvc/spring-mvc.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd">

    <context:annotation-config/>

    <bean id="redisHttpSessionConfiguration" class="org.springframework.session.data.redis.config.annotation.web.http.RedisHttpSessionConfiguration">
        <property name="maxInactiveIntervalInSeconds" value="600" />
    </bean>

    <bean class="org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory" destroy-method="destroy">
        <property name="hostName" value="${Redis.HostName}" />
        <property name="port" value="${Redis.Port}" />
        <property name="password" value="${Redis.Password}" />
    </bean>

</beans>
```
### 4. web.xml에 filter 추가 

```xml
<filter>
    <filter-name>springSessionRepositoryFilter</filter-name>
    <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>
<filter-mapping>
    <filter-name>springSessionRepositoryFilter</filter-name>
    <url-pattern>/*</url-pattern>
    <dispatcher>REQUEST</dispatcher>
    <dispatcher>ERROR</dispatcher>
</filter-mapping>
```

### ※ 참조

* https://enterkey.tistory.com/302
* https://androids.tistory.com/54
* https://www.jisblee.me/board/view/10/1/336/ko
* http://wiki.plateer.com/pages/viewpage.action?pageId=8552454
* http://arahansa.github.io/docs_spring/session.html#httpsession-redis-jc

Spring-redis-session 클라우드 적용
==================================

### 1. App 임시 배포
   
* cf push &lt;app name&gt; -f &lt;manifest file name&gt; --no-start 명령을 이용하여 App을 배포한다.
* --no-start 옵션을 지정하면 클라우드 배포 후 App을 실행하지 않는다.

```shell
C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git>cf push csr -f manifest-cloud.yml --no-start
Pushing from manifest to org 중소벤처24시스템_운영 / space 사회적책임경영시스템 as wildrain...
Using manifest file C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git\manifest-cloud.yml
Getting app info...
Updating app with these attributes...
  
  ... 중간 생략 ...
  
     state   since                  cpu    memory   disk     details
#0   down    2021-03-03T09:13:03Z   0.0%   0 of 0   0 of 0

```

### 2. Redis 서비스 신청

* 클라우드에 배포된 app에서 Redis 서비스를 사용하기 위해서는 서비스 신청(Provision)을 해야한다.
* cf marketplace 명령을 이용하여 PaaS-TA Marketplace에 서비스가 있는지 확인한다.

```shell
C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git>cf marketplace
Getting services from marketplace in org 중소벤처24시스템_운영 / space 사회적책임경영시스템 as wildrain...
OK

service             plans                    description                                                                                                     broker
nfs                 Existing                 Existing NFSv3 and v4 volumes (see: https://code.cloudfoundry.org/nfs-volume-release/)                          nfsbroker
redis               dedicated-vm             A paasta source control service for application development.provision parameters : parameters {owner : owner}   on-demand-redis-service
Pinpoint            Pinpoint_standard        A simple pinpoint implementation                                                                                pinpoint-service-broker
container-service   Micro, Small, Advanced   For Container Service Plans, You can choose plan about CPU, Memory, disk.                                       container-service

TIP: Use 'cf marketplace -s SERVICE' to view descriptions of individual plans of a given service.
```

* cf create-service &lt;service name&gt; &lt;plan name&gt; &lt;instance name&gt; 명령을 이용하여 redis 서비스를 신청(Provision)한다.

```shell
C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git>cf create-service redis dedicated-vm redis-instance
Creating service instance redis-instance in org 중소벤처24시스템_운영 / space 사회적책임경영시스템 as wildrain...
OK

Create in progress. Use 'cf services' or 'cf service redis' to check operation status.
Attention: The plan `dedicated-vm` of service `redis` is not free. The instance `redis`
will incur a cost. Contact your administrator if you think this is in error.
```

* cf service &lt;instance name&gt;  명령을 이용하여 redis 서비스 인스턴스의 status를 확인한다.
* status가 'create in progress'인 상태일 경우 서비스 준비중이므로 서비스 이용 및 바인드, 삭제가 제한 되므로 'create succeedes'가 될때까지 기다려야 한다.

```shell
C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git>cf service redis-instance
Showing info of service redis-instance in org 중소벤처24시스템_운영 / space 사회적책임경영시스템 as wildrain...

name:             redis-instance
service:          redis
tags:             session-replication
plan:             dedicated-vm
description:      A paasta source control service for application development.provision parameters : parameters {owner : owner}
documentation:    https://paas-ta.kr
dashboard:        172.0.128.22
service broker:   on-demand-redis-service

Showing status of last operation from service redis-instance...

status:    create succeeded
message:   test
started:   2021-01-04T00:58:27Z
updated:   2021-01-04T01:00:31Z
```

### 3. Redis 서비스 바인딩

* 서비스 신청이 완료되면 클라우드에 배포된 App에 Bind 하여 App에서 Redis 서비스를 이용한다.
* cf bind-service &lt;app name&gt; &lt;service instance name&gt; 명령을 이용하여 App에 Service를 바인딩한다.

```shell
C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git>cf bind-service csr redis-instance
Binding service redis-instance to app csr in org 중소벤처24시스템_운영 / space 사회적책임경영시스템 as wildrain...
OK

TIP: Use 'cf restage csr' to ensure your env variable changes take effect
```

* cf restage &lt;app anem&gt; 명령을 이용하여, 서비스 바인딩을 적용하기 위해 App를 restage 한다.

```shell
C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git>cf restage csr
This action will cause app downtime.

Restaging app csr in org 중소벤처24시스템_운영 / space 사회적책임경영시스템 as wildrain...

Staging app and tracing logs...
   Downloading pinpoint_buildpack_offline...
   Cell ad5c0460-dcbf-4230-9c7d-f42e0fa6dec8 successfully created container for instance 3e688049-1f6e-422d-83f1-02af2e5c94fe
   Downloading app package...
   Downloaded app package (71.2M)
   -----> Java Buildpack 2402a2c (offline) | https://github.com/PaaS-TA/PINPOINT-BUILDPACK-MASTER.git#2402a2c
   -----> Downloading Jvmkill Agent 1.16.0_RELEASE from https://java-buildpack.cloudfoundry.org/jvmkill/bionic/x86_64/jvmkill-1.16.0-RELEASE.so (found in cache)
  
  ... 중간 생략 ...
  
     state     since                  cpu    memory         disk           details
#0   running   2021-03-03T08:17:33Z   0.0%   343.3M of 2G   217.1M of 2G
```

### 4. Redis 접속 정보 추출

* cf env <app_name> 명령을 이용하여 App 환경을 조회한다.

```shell
C:\eGovFrameDev-3.8.0-64bit\workspace\csr-git>cf env csr
Getting env variables for app csr in org 중소벤처24시스템_운영 / space 사회적책임경영시스템 as wildrain...
OK

System-Provided:
{
 "VCAP_SERVICES": {
  "redis": [
   {
    "binding_name": null,
    "credentials": {
     "host": "172.0.128.22",
     "password": "t1P@eoalsxhdgkq",
     "port": 16379
    },
    "instance_name": "redis-instance",
    "label": "redis",
    "name": "redis-instance",
    "plan": "dedicated-vm",
    "provider": null,
    "syslog_drain_url": null,
    "tags": [
     "dedicated-vm",
     "session-replication"
    ],
    "volume_mounts": []
   }
  ]
 }
}

... 중간 생략 ...

}

...
```

### 5. properties 파일 적용

* cf env 명령 실행결과 화면에서 System-Provided > VCAP_SERVICES > redis 항목의
  'host', 'password', 'prot' 정보를 이용하여 properties 파일에 적용한다.

```properties
Redis.HostName  = 172.0.128.22      # redis 서버 IP
Redis.Port      = 16379             # redis 포트
Redis.Password  = t1P@eoalsxhdgkq   # 비밀번호
```


### 6. 배포

* Redis 정보를 적용하기 위하여 Maven Install 후 App을 재 배포한다.

```shell
cf push cobiz -f manifest-cloud.yml
```

### ※ 주의 사항

* App과 Service를 바인딩 한 후 App를 delete 하지 않았다면 다음 push 적용시 다시 Service를 바인딩 할 필요 없다.
* Service가 바인딩된 App의 경우 delete하면 다시 해당 서비스를 바인딩해야 하므로 불필요하게 App을 delete 하지 않는다.