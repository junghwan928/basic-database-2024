-- 박지성이 구매한 도서의 출판사
SELECT COUNT(distinct publisher) as '박지성 구매 출판사' from Book where bookid in (
SELECT bookid From Orders
where custid = (select custid from Customer WHERE [name] = '박지성'));

-- 똑같은 문제 조인으로 
SELECT COUNT(distinct B.publisher) as '구매책 출판사수' FROM Book AS B, Orders AS O, Customer AS C
    WHERE B.bookid = O.bookid
    and O.custid = c.custid
    and c.[name] = '박지성';

-- 박지성이 구매한 도서의 이름, 가격. 정가와 판매가격의 차이
SELECT B.bookname, B.price, O.saleprice, (B.price - O.saleprice) as '정가와의 차' 
 FROM Book AS B, Orders AS O, Customer AS C
    WHERE B.bookid = O.bookid
    and O.custid = c.custid
    and c.[name] = '박지성';

-- 박지성이 구매하지 않은 도서의 이름
SELECT b.bookname from Book as b 
    where b.bookid not IN(SELECT O.bookid FROM Book AS B, Orders AS O, Customer AS C
    WHERE B.bookid = O.bookid
    and O.custid = c.custid
    and c.[name] = '박지성')