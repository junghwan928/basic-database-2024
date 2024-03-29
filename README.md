# basic-database-2024
부경대학교 2024 IoT 개발자 과정 기초 프로그래밍 언어－MySQL


## 1일차
-  MS SQL Server 설치 : https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads = 최신버전
    - DBMS 엔진 - 개발자 버전
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화
        ![기능선택](https://raw.githubusercontent.com/junghwan928/basic-database-2024/main/Image/db001.png)
        
        - 데이터베이스 엔진 구성부터 중요
            - Windows인증모드로 하면 외부에서 접근불가
            - 혼합모드(SA)에만 암호 지정 / mssql_p@ss(8자이상/ 대소문자구분 / 특수문자 1자 이상)
            - 데이터 루트 디렉토리 변경


    - [개발툴 설치](https://learn.microsoft.com/ko-kr/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
        - SSMS(SQL SERVER MANAGE STUDIO) - DB에 접근 -> 여러개발 작업할때 사용

    - 데이터베이스의 개념
        - 통합된 데이터: 데이터를 통합하는 개념. 각자 사용하던 데이터의 중복을 최소화하여 중복으로 인한 데이터 불일치 제거
        - 저장된 데이터: 문서로 보관된 데이터가 아니라 컴퓨터 저장장치에 저장된 데이터
        - 운영 데이터: 조직의 목적을 위해 사용되는 데이터. 즉, 업무를 위한 검색을 목적으로 저장됨
        - 공용 데이터: 한 사람 또는 한 업무를 위해 사용되는 데이터가 아니라 공동으로 사용되는 데이터를 의미

    - 데이터베이스 기초
        - 데이터를 보관, 관리, 서비스하는 시스템
        - DATA, INFORMAITON, KNOWLEDGE 개념
        - DBMS > Database > Data(Model)
    
    - 데이터 모델(Data Model) 
        - 계층 데이터 모델(hierarchical data model)
        - 네트워크 데이터 모델(network data model)
        - 관계 데이터 모델(relation data model)
        - 객체 데이터 모델(object data model)
        - 객체-관계 데이터 모델(object-relational data model)

    
    - 데이터베이스 시스템의 구성
        - DBMS: 사용자와 데이터베이스를 연결시켜주는 소프트웨어
        - 데이터베이스: 데이터를 모아둔 토대
        - 데이터 모델: 데이터가 저장되는 기법에 관한 내용

    - DB언어
        - SQL(Structed Query Language) = 구조화된 질이 언어
            - DDL (Data Definition Language) - 데이터베이스,테이블의 구조, 인덱스 = 정의, 변경
                - CREATE : 데이터베이스 및 객체 생성
                - DROP : 데이터베이스 및 객체 삭제
                - ALTER : 기존에 존재하는 데이터베이스 객체를 변경

            - DML (Data Manipulation Language) - 데이터의 삽입, 삭제, 검색과 수정 등을 처리
                - INSERT (삽입) : 데이터베이스 객체에 데이터 입력
                - DELETE (삭제) : 데이터베이스 객체에 데이터 삭제
                - UPDATE (수정) : 기존에 존재하는 데이터베이스 객체안의 데이터 수정
                - SELECT (검색) : 데이터베이스 객체로부터 데이터 검색
            
            - DCL (Data Control Language) - 데이터베이스 사용자의 권한을 제어
                - GRANT : 데이터베이스 객체에 권한 부여
                - REVOKE : 이미 부여된 데이터베이스 객체의 권한 취소

            - TCL(Transaction Control Language)
                - DCL에서 트랜잭션을 제어하는 명령 
                    - => COMMIT + ROLLBACK만을 따로 분리해서 표현
                    ![Commit](https://raw.githubusercontent.com/junghwan928/basic-database-2024/main/Image/Commit.jpg)
    
    - 데이터모델
        - 객체-관계 데이터 모델
        - 객체 데이터 모델
        - 관계 데이터 모델

    - 데이터베이스의 개념적 구조
        - 3단계 데이터베이스 구조
        ![struct](https://raw.githubusercontent.com/junghwan928/basic-database-2024/main/Image/img.png)

            - 외부 스키마 = 일반 사용자나 응용 프로그래머가 접근하는 계층
                - 전체 데이터메이스 중에서 하나의 논리적인 부분을 의미
            
            - 개념 스키마 = 전체 데이터베이스의 정의를 의미
            - 내부 스키마 = 물리적 저장 장치에 데이터베이스가 실제로 저장되는 방법의 표현


    - SQL 기본 학습
        - SSMS 로 실행
        - SELECT문
        ![SSM Login](https://raw.githubusercontent.com/junghwan928/basic-database-2024/main/Image/db002.png)

    - DML 학습
        - SQL 명령어 키워드 : SELECT, INSERT, UPDATE, DELETE
        - IT개발 표현언어 : Request, Create, Update, Delete(CRUD로 부름. -> CRU개발 뜻은 INSERT,UPDATE,DELETE로 개발)
        - SELECT (검색)
            ```SQL
            SELECT [ALL | DISTINCT] 속성이름(들)
                FROM 테이블 이름(들)
                [WHERE 검색조건(들)]
                [GROUP BY 속성이름(들)]
                [HAVING 검색조건(들)]
                [ORDER BY 속성이름(들) [ASC | DESC]]
            ```
    

    - 단계별 검색
    ```SQL
        --- step 1
        SELECT * /* ALL */
	        FROM Customer

        --- step 2
        SELECT * 
	        FROM Customer
	        WHERE [name] = '김연아';

        --- step 3
        SELECT phone 
	        FROM Customer
	        WHERE [name] = '김연아';
        ```
        - step 1 -> 수정 -> step 2 -> 수정 ->step 3


    
## 2일차