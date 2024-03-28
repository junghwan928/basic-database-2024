-- 모든 도서의 이름과 가격을 조회
-- CTRL+SHIFT+U -> 대문자, CTRL+SHIFT+L -> 소문자

SELECT bookname, price
	FROM Book;

-- 모든 도서의 가격와 이름을 검색
SELECT price, bookname
	FROM Book;

-- 모든 도서의 도서번호, 도서이름, 출판사 가격을 검색
SELECT *
	FROM Book;

SELECT bookid, bookname, publisher, price
	FROM Book;