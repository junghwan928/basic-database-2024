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
                    - COMMIT : 트랜잭션 작업이 정상 완료되면 변경 내용을 영구 저장
                    - ROLLBACK : 트랜잭션 작업을 취소하고, 최근 COMMIT한 시점으로 이동
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
- Database 학습
    - DB  개발시 사용할 수 있는 툴
        - VISUAL STUDIO : 아무런 설치 없이 개발 가능
        - VISUAL STUDIO CODE : SQL SERVER (MSSQL) 플로그인 설치하고 개발
    - VS CODE 에서 DB개발하기
    - ServerName(HostName) - 내 컴퓨터의 이름|내 네트워크 주소|127.0.0.1(LoopBack IP)|localhost(LoopBack URL)
    - 관계 데이터 모델
        - 릴레이션 : 행과 열로 구성된 테이블(관계 데이터모델 에서만)
            - 행, 튜플 ,열, 속성, 스키마, 인스턴트 용어
        - 매핑되는 이름 테이블(실제 DB)
            - 행 레코드 열 컬럼 컬럼이름 데이터
        - 차수(Degree) - 속성의 개수
        - 카디날리티(Cardinality) - 튜플의 수
    
    - 릴레이션 특징
        a. 속성은 단일값을 가짐(책이름이 여러개 들어가면 안됨)

        b. 속성은 다른 이름으로 구성(책이름이라는 속성이 두번있으면 안됨)

        c. 속성의 값은 정의된 도메인값만 가짐(대학교 학년에 5학년이 있으면 안됨)

        d. 속성의 순서는 상관없음

        e. 린레이션내 중복된 튜플 허용 안됨(같은 책 정보를 두번 넣을 수 없음)

        f. 튜플 순서는 상관없음(1,3,5,2,6...)

    - 관계 데이터 모델
        - 릴레이션
        - 제약조건
        - 관계대수

- DML 학습
    - Select 문
        - 복합조건(ASC, DESC), 정렬
        - 집계함수와 GROUP BY
            - SUM(총합)
            - AVG(평균)
            - COUNT(계수)
            - MIN(최솟값)
            - MAX(최댓값)
	    - 집계함수 외 일반 컬럼은 GROUP BY 절에 속한 컬럼만 SELECT문에 사용가능
 	    - HAVING은 집계함수의 필터로 GROUP BY 뒤에 작성, WHERE절과 필터링이 다름
	    - 두 개 이상의 테이블 질의(Query)
    
- 관계형 DB에서 가장 중요한 기법 중 하나 : JOIN!
    - INNER JOIN(내부 조인) [참조](https://sql-joins.leopard.in.ua/)
    - LEFT|RIGHT OUTER JOIN(외부 조인) - 어느 테이블이 기준인지에 따라서 결과가 상이함
    ![join](https://raw.githubusercontent.com/junghwan928/basic-database-2024/main/Image/join.png)



## Day03
- DataBase 학습
    - 관계 데이터 모델
        - 무결성 제약 조건
            - SUPER KEY - 유일한 값으로 구분 지을수 있는 속성 또는 속성집합(고객번호 | 주민번호 | 고객번호/이름 | 고객번호/주소, 고객번호/이름/전화번호... = 이름만은 안됨)  
                - 튜플을 유일하게 식별할 수 있는 하나의 속성 혹은 속성의 집합
                - 튜블을 유일하게 식별할 수 있는 값이 있으면 모두 슈퍼키가 될 수 있음
        
            - 복합키 - 후보키 중 속성을 2개 이상 집합을 한 키
            - 후보키 - 튜플을 유일한 값으로 구분 지을수 있는 속성 최소한의 속성 집합
        
            -  기본키(Primary Key * 1) - 여러 후보키 중에서 하나를 선정하여 대표로 삼는 키
                - 고려사항 - 고유한 값(Uniqe), NULL불가(Not Null), 최소 속성의 집합
            
            - 대리키 - 기본키가 여러개의 속성으로 구성되어 복잡하거나, 보안문제가 생길때 새롭게 생성하는 키
            - 외래키(Foriegn key *) - 기본키르 참조하여 사용하는 것
                - 고려사항 - 다른 릴레이션과의 관계, 다른 릴레이션의 기본키를 호칭, 서로 같은 값이 사용, 기본키가 변경되면 외래키도 변경되어야 함
                            NULL과 중복을 허용(NOT NULL인 경우도 있음), 자기자신의 기본키를 외래키로 사용할 수도 있음, 왜래키가 기본키의 속성중 하나가 될 수 도 있음
            
            - 데이터 무결성(Integrity) - DB에 저장된 데이터의 일관성과 정확성을 지키는 것
                - 도메인 무결성 제약조건 - 데이터 타입, NOT NULL, 기본값, 체크 특성을 지키는 것
                - 개체 무결성 제약조건 - 기본키 제약조건으로도 부름 . Unique에 NOT NULL.(값이 중복되어도 안되고, 빠져도 안됨)
                - 참조 무결성 제약조건 - 외래키 제약조건으로도 부름. 부모의 키가 아닌 값은 사용할 수 없음. (외래키가 바뀔때 기본키의 값이 아닌 것은 제약을 받는다.)
                    - RESTRICT(자식에서 키를 사용하고 있으면 부모 삭제 금지)
                    - CASCADE(부모가 지워지면 해당 자식도 같이 삭제)
                    - DEFAULT(부모가 지워지면 자식은 지정된 기본값으로 변경)
                    - NULL(부모가 지워지면 자식의 해당값을 NULL로 변경)
                - 유일성 제약조건 - 일반 속의 값이 중복되면 안되는 조건. NULL 값은 허용.

    
- DML 학습
    - SELECT 문
        - OUTER JOIN(외부조인)
            - LEFT|RIGHT|FULL(FULL은 거의 사용 안함) 
                - 왼쪽 테이블을 기준으로 조건이 일치하지 않은 왼쪽 테이블 데이터로 모두 표시(LEFT OUTER JOIN) 
                
                - 오른쪽 테이블 기준으로 조건에 일치하지 않은 오른쪽 테이블 데이터 모두 표시(RIGHT OUTER JOIN)
            
            - 부속질의(SUB QUERY)
                - 쿼리 내에 다시 쿼리를 작성하는 것
                - 서브쿼리를 쓸 수 있는 장소
                    - SELECT 절 - 한컬럼에 하나의 값만
                    - FROM 절 - 가상의 테이블로 사용
                    - WHERE 절 - 여러 조건에 많이 사용

            - 집합연산 - JOIN 도 집합이지만, 속성별로 가로로 병합하기 때문에 집합이라 부르지 않음. 집합은 데이터를 서로로 합치는 것을 못함
                - 합집합(UNION, 사용 많이함) - UNINON(중복제거), UNION ALL(중복허용)
                - 차집합(EXCEPT, 거의 사용 안함)
                - 교집합(INTERSECT, 거의 사용 안함)
                - EXISTS


- DDL 학습
    - CREATE - 개체(데이터베이스, 테이블, 뷰, 사용자 등)을 생성하는 구문
    ```SQL
    -- CREATE 테이블 생성에 한정
    CREATE TABLE 테이블명
    ({ 속성이름 데이터타입
    [NOT NULL]
    [UNIQUE]
    [DEFALUT 기본값]
    [CHECK 체크조건]
    }
    [PRIMARY KEY 속성이름(들)]
    {
        [FORIEGN KEY 속성이름 REFERENCES 테이블이름(속성이름)]
        [ON UPDATE [NO ACTION | CASCADE | SET NULL | SET DEFAULT]]
    }
    )

    
    ```
    - ALTER - 개체를 변경/수정하는 구문
    ``` sql
    ALTER TABLE 테이블명
    [ADD 속성이름 데이터타입]
    [DROP COLUM 속성이름]
    [ALTER COLUM 속성이름 데이터타입]
    [ALTER COLUM 속성이름 [NULL | NOT NULL]]
    [ADD PRIMARY KEY(속성이름)]
    [[ADD | DROP] 제약조건이름];
    ```

    - DROP - 개체를 삭제하는 구문
    ```SQL
    DROP TABLE 테이블명;
    ```


## 4일차
- 관계 데이터 모델
    - 관계대수 
        - 릴레이션에서 원하는 결과를 얻기위한 수학의 대수와 같은 연산 사용 기술하는 언어
        - 설렉션, 프로젝션, 조인, 카디션 프로덱트, ETC...

- DML 학습(SELECT외)
    - INSERT
    ```SQL
    INSERT INTO 테이블이름[(속성리스트)]
        VALUES (값리스트);
    ```

    - UPDATE
    ```sql
    UPDATE 테이블이름
        SET 속성이름1=값[, 속성이름2 = 값, ...]
    [WHERE <검색조건>] -- 실무에서는 절대 빼면 안됨
    ```
    - DELETE
    ```sql
    -- 트랜잭션을 걸어서 복구를 대비
    DELETE FROM 테이블이름
        WHERE <검색조건> -- 실무에서는 빼면 큰일남
    ```


- SQL 고급
    - 내장함수
        - 수학함수, 문자열함수, 날짜/시간함수, 반환함수, 커서함수, 보안함수, 시스템함수등
    - 서브쿼리 리뷰
        - SELECT = 단일행, 단일열 (스칼라 서브쿼리)
        - FROM = 다수행, 다수열
        - WHERE = 다수행, 단일열 (보통)
            - 비교연산, 집합연산, 한정연산, 존재연산

## 5일차
- SQL 고급
    - 서브쿼리 리뷰
    - 뷰
        - 복잡하고 쿼리로 생성되는 결과를 자주 사용하기 위해서 만드는 개체
        - 편리하고, 보안에 강하며, 논리적 독립성을 띰
        - 원본데이터가 변경되면 같이 변경되고, 인덱스 생성은 어렵, CUD 연산에 제약 있음

        ```sql
        -- 생성
        CREATE view 뷰이름[(열이름 [, ... ])]
        AS <SELECT 쿼리문>;

        -- 수정
        ALTER VIEW 뷰이름[(열이름 [, ... ])]
        AS <SELECT 쿼리문>;
        -- 삭제
        DROP DATABASE 이름
        ```


    - 인덱스
    ```sql
    --- 생성
    CREATE[UNIQUE] [CLUSTERED|NONCLUSTERED] INDEX 인덱스 이름
    ON 테이블명 (속성이름 [ASC|DESC], [... N]);
    
    -- 수정
    ALTER INDEX {인덱스 이름 | ALL}
    ON 테이블명 {REBULID | DISABLE | REORGANIZE}

    -- 삭제
    DROP INDEX 인덱스 이름 ON 테이블명;
    ```

- SSMS에서 실행계획을 가지고 쿼리 실행 성능 체크 할 수 있음 

- 파이썬 SQL SERVER 연동 프로그래밍
    - Madang DB 관리 프로그램
        - PyQT GUI 생성
        - SQL Server 데이터 핸들링
            - pymysql 라이브러리 설치
            ```shell
            > pip install pymssql
            ```

        - DB 연결설정 - Oracle, MySQL 등 설정이 없음. 구성관리자에서 TCP/IP로 접근을 허용하지 않으면 접속이 안됨
            - 1. 시작메뉴 > 모든 앱> Microsoft SQL Server 20xx > SQL SERVER 20XX 구성관리자 실행
            - 2. SQL SERVER 네트워크 구성 > MSSQL SERVER에 대한 프로토콜 클릭
            - 3. TCP/IP 프로토콜 상태가 사용안함(최초) > TCP/IP를 더블클릭
            - 4. 프로토콜 사용 > 예, 로 변경
            - 5. IP주소 탭 > IP주소가 본인아이피 인것 > 사용 > 예로 변경
            - 6. 127.0.0.1로 된 주소 > 사용 > 예 로 변경
            - 7. 적용후 SQL Server 서비스 > SQL Server(MSSQLSERVER) 더블클릭 후 , **다시 시작** 버튼 클릭후 , 재시작 필요
            ![join](https://raw.githubusercontent.com/junghwan928/basic-database-2024/main/Image/db005.png)

- 데이터 모델링

## 6일차
- 파이썬 SQL Server 연동 프로그래밍
    - Madang DB 관리 프로그램
        - PyQT5 + pymssql
    
    - 문제점 - 한글 깨짐 문제
        - DB 테이블의 varchar(ASCII) -> nvarchar(UTF-8) 변경
        - Python에서 pymssql로 접속할 때, Charset을 'UTF8'로 설정
        - INSERT 쿼리에 한글 입력되는 컬럼은 'N'을 붙여줌(유니코드로 입력하라는 뜻)

## 7일차
- SQL 고급
    - 트랜잭션 - All or Nothing
        - 트랜잭션의 속성(ACID)
            - 원자성(Atomicity), 일관성(Consistency), 고립성(Isolation), 지속성(Durability)

    - TCL에서 사용할 키워드 
        - BEGIN, TRAN[SACTION], COMMIT, ROLLBACK, SAVE
    
    - SQL Server는 기본적으로 Auto Commit(시스템이 자동으로 트랜잭션을 건다)

    - SSMS > 도구 > 옵션 > 쿼리실행 > SQL Server > ANSI -> SET IMPLICIT_TRANSACTIONS 체크, 프로그램 재시작

    - 트랜잭션 - 로직 처리시 다른 트랜잭션의 간섭을 받지 않기 위한 것(Lock), 중요한 데이터 수정, 삭제 시 잘못된 변경을 방지하기 위한 것

- 데이터 모델링
    - 설계(모델링) 순서 - 개념 설계 -> 논리 설계 -> 물리 설계
        - 개념모델링 - 요구사항을 받으면서 정해지지 않은 여러 개체들을 정립화 하는 단계
        - 논리모델링 - 기본키 지정, 외래키 지정, 관계 정립, 속성들 이름(한글) 개체를 정하는 단계
        - 물리모델링 - DB에 맞춰서 컬럼이름, 컬럼 데이터타입 및 크기 지정, DB에 대한 검토로 테이블을 만들기 직전의 설계를 완성
        - ER 모델링 - ERD를 그리기위한 기본 이론

- 인덱스 예제
    - PK나 인덱스가 없는 상태에서 성능문제 체크
    - 인덱스가 설정되면 성능이 어떤지 비교
    - 더미 생성시 100만건으로 제약을 두고 시작

## 8일차
- 인덱스 예제
- 정규화
- 실무실습(사용자, 권한)