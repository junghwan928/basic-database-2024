# basic-database-2024
부경대학교 2024 IoT 개발자 과정 기초 프로그래밍 언어－MySQL


## 1일차
-  MS SQL Server 설치 : https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads = 최신버전
    - DBMS 엔진 - 개발자 버전
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화
        - 데이터베이스 엔진 구성부터 중요
            - Windows인증모드로 하면 외부에서 접근불가
            - 혼합모드(SA)에만 암호 지정 / mssql_p@ss(8자이상/ 대소문자구분 / 특수문자 1자 이상)
            - 데이터 루트 디렉토리 변경
    - 개발툴 설치
        - SSMS(SQL SERVER MANAGE STUDIO) - DB에 접근 -> 여러개발 작업할때 사용

    - 데이터베이스 기초
        - 데이터를 보관, 관리, 서비스하는 시스템
        - DATA, INFORMAITON, KNOWLEDGE 개념
        - DBMS > Database > Data(Model) 

    - DB언어
        - SQL(Structed Query Language) = 구조화된 질이 언어
            - DDL (Data Definition Language) - 데이터베이스,테이블의 구조, 인덱스 = 정의, 변경
                - CREATE : 데이터베이스 및 객체 생성
                - DROP : 데이터베이스 및 객체 삭제
                - ALTER : 기존에 존재하는 데이터베이스 객체를 변경

            - DML (Data Manipulation Language) - 데이터의 삽입, 삭제, 검색과 수정 등을 처리
                - INSERT : 데이터베이스 객체에 데이터 입력
                - DELETE : 데이터베이스 객체에 데이터 삭제
                - UPDATE : 기존에 존재하는 데이터베이스 객체안의 데이터 수정
                - SELECT : 데이터베이스 객체로부터 데이터 검색
            
            - DCL (Data Control Language) - 데이터베이스 사용자의 권한을 제어
                - GRANT : 데이터베이스 객체에 권한 부여
                - REVOKE : 이미 부여된 데이터베이스 객체의 권한 취소
    
    - 데이터모델
        - 객체-관계 데이터 모델
        - 객체 데이터 모델
        - 관계 데이터 모델

    - 데이터베이스의 개념적 구조
        - 3단계 데이터베이스 구조
![struct](https://raw.githubusercontent.com/junghwan928/basic-database-2024/main/Image/img.png)
            - 외부 <-> 개념 <-> 내부 <-> 데이터베이스(물리적 데이터구조)
            - 외부 스키마 = 일반 사용자나 응용 프로그래머가 접근하는 계층
                - 전체 데이터메이스 중에서 하나의 논리적인 부분을 의미
            
            - 개념 스키마 = 전체 데이터베이스의 정의를 의미
            - 내부 스키마 = 물리적 저장 장치에 데이터베이스가 실제로 저장되는 방법의 표현

## 2일차