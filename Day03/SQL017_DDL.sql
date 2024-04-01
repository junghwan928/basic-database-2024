-- DDL 데이터 정의 언어
-- 객체 생성, 수정, 삭제

-- 1. NEWBOOK이라는 테이블이라는 생성
/*
    BOOKID(도서번호 = 기본키) - INT 
    BOOKNAME(도서이름) - VARCHAR(20)
    PUBLISHER(출판사) - VARCHAR(20)
    PRICE - INT

    - 타입종류 
        = int[정수], bigint[큰정수], binary(50) [이진데이터], bit = [0.1] char(n) = [고정문자], varcar(n) = 가변문자열, nVarchar(n) = [유니코드]
        = DATE = 날짜, DATETIME = 날짜시간 , DECIMAL(18,0) => 소수점 표현실수, FLOAT = 실수, smallint = 255까지의 정수, text = 2GB기가까지의 텍스트
        = IMAGE = 이미지 바이너리, 
    - 예) char(10) = 'hugo   '  => 이름을 넣고 10개의 자리중 빈곳은 전부 스페이스 입력 ' '
    - VARCHAR(10) = 'HUGO ' => 이름을 넣고 10개의 자리중 빈곳은 전부 없앰

    - 가장 많이 쓰는 타입
    = int, char, varchar, datetime, decimal, float, text외에는 잘 안씀
*/
DROP TABLE NewBook;

CREATE TABLE NewBook (
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY (bookid) -- 기본키로 bookid 지정
);

-- 기본키를 통합
CREATE TABLE NewBook (
    bookid INT PRIMARY KEY,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
);

-- 기본키가 두개 이상이면,
CREATE TABLE NewBook (
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY (bookid, bookname) -- 기본키로 bookid 지정
);

-- 각 컬럼에 제약조건을 걸면
CREATE TABLE NewBook(
    bookname VARCHAR(20) NOT NULL,
    publisher VARCHAR(20) UNIQUE, -- 유니크 제약조건
    price INT DEFAULT 10000 CHECK(price > 1000) -- 기본값 제약조건, 체크 제약조건
    PRIMARY KEY(bookname, publisher) -- 
)

-- 고객테이블
CREATE TABLE NewCustomer(
    custid INT PRIMARY KEY,
    custname VARCHAR(40),
    cusaddress VARCHAR(255),
    phone VARCHAR(30)
);

-- 새 주문테이블
CREATE TABLE NewOrder(
    orderid INT,
    custid INT NOT NULL,
    boookid INT NOT NULL,
    saleprice INT,
    orderdate DATE,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES NewCustomer(custid)ON DELETE CASCADE
)

 -- 2. 테이블 변경/수정 ALTER
 CREATE TABLE MyBook(
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
 )

 -- Mybook에 ISBN 
 ALTER TABLE MyBook ADD ISBN VARCHAR(133);

-- ISBN를 INT 형
 ALTER TABLE MyBook ALTER COLUMN ISBN INT;

-- ISBN 컬럼 삭제
 ALTER TABLE MyBook DROP COLUMN ISBN;

-- BOOKNAME을 NOT NULL로 제약 조건적용
 ALTER TABLE MyBook ALTER COLUMN bookname INT NOT NULL;

-- BOOKID 기본키 설정
 ALTER TABLE MyBook ALTER COLUMN bookid INT NOT NULL;
 ALTER TABLE MyBook ADD PRIMARY KEY(bookid);

 DROP TABLE MyBook;

DROP TABLE NewOrder;
DROP TABLE NewCustomer;

DROP TABLE Testtable;
DROP table NewBook