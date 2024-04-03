-- 인덱스(책의 목차와 기능 동일)
-- BOOK의 BOOKNAME 열에 넌클러스터링 인덱스 ix_book생성
CREATE INDEX ix_book_BOOKNAME ON Book(bookname);

-- Customer의 name열에 클러스터링 인덱스 (CIX_CUSTOMER_NAME)
-- 보통 이런식으로 안걸었음
-- 기본키에 클러스터드, 나머지 컬럼 넌클러스터드 인덱스 설정
CREATE CLUSTERED INDEX CIX_CUSTOMER_NAME ON Customer(name);

-- Book에 publisher, price 동시에 인덱스 ix_book_pubprice 인덱스 생성
CREATE INDEX ix_book_pubprice ON Book(publisher, price);

-- 인덱스 재구성
-- PK인 기본키는 값이 추가되면 자동으로 인덱스 재구성
-- 넌클러스터드 인덱스는 재구성 필요할수 있음
ALTER INDEX ix_book_pubprice ON Book REBUILD; -- 인덱스 재정리
ALTER INDEX ix_book_pubprice ON Book reorganize; -- 인덱스 재정리

DROP INDEX ix_book on Book;
DROP INDEX CIX_CUSTOMER_NAME on Customer;