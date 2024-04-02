-- 삽입(INSERT)
INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES (11, '스포츠의학', '한솔의학서적', 90000);

-- 속성리스트는 생략가능
INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES (12, '스포츠의학2', '한솔의학서적', 110000);

-- 값을 생략 가능(단, 값을 생략하면 컬럼을 다 지정해줭함)
INSERT INTO Book(bookid, bookname, publisher)
    VALUES (13, '스포츠의학2', '한솔의학서적');

-- 새 테이블 생성
-- 여기는 3장에서 사용되는 IMPORTED_BOOK 테이블
CREATE TABLE Imported_Book (
  bookid      INT,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT 
);
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

-- 특수 INSERT
INSERT INTO Book(bookid, bookname, publisher, price)
    SELECT bookid, bookname, publisher, price
        FROM Imported_Book;

-- 수정(UPDATE)
-- 사전 준비 = 이전의 customer 테이블내용을 customernew로 복사
select custid, name, address, phone
    INTO CustomerNew
    from Customer;

-- CUSTOMER 테이블에서 고객번호가 5번인 고객주소를 대한민국 부산으로 변경
UPDATE Customer
    set [address] = '대한민국 PUSAN'
    WHERE custid = 5;

-- Customer 테이블에서 박세리 고객의 주소를 김연아 주소로 변경
UPDATE Customer SET [address] = (
                                    SELECT [address] FROM Customer
                                    WHERE [name] = '김연아')
WHERE [name] = '박세리'


UPDATE CustomerNew
    SET [name] = '박채리', [address] = '미국 뉴욕', phone = '+01 010-123-456'
    WHERE custid = 5;
 

-- 삭제
DELETE FROM CustomerNew
    WHERE custid = 5;

-- 수정, 삭제는 항상 트랜잭션과 같이 실행해야 함

-- '스포츠세계' 도서 삽입
INSERT INTO Book (bookname, bookid ,publisher, price)
VALUES ('스포츠세계', 23,  '대한미디어', 10000);

-- '삼성당'에서 출판한 도서 삭제
DELETE FROM Book
WHERE publisher = '삼성당';

-- '이상미디어'에서 출판한 도서 삭제
-- Orders 테이블에서 해당 도서를 주문한 레코드 삭제
DELETE FROM Orders
WHERE bookid IN (SELECT bookid FROM Book WHERE publisher = '이상미디어');

-- Book 테이블에서 '이상미디어' 출판사의 도서 삭제
DELETE FROM Book
WHERE publisher = '이상미디어';

-- 출판사 이름 변경
UPDATE Book
SET publisher = '대한출판사'
WHERE publisher = '대한미디어';


