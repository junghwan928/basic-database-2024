-- ��� ������ �̸��� ������ ��ȸ
-- CTRL+SHIFT+U -> �빮��, CTRL+SHIFT+L -> �ҹ���

SELECT bookname, price
	FROM Book;

-- ��� ������ ���ݿ� �̸��� �˻�
SELECT price, bookname
	FROM Book;

-- ��� ������ ������ȣ, �����̸�, ���ǻ� ������ �˻�
SELECT *
	FROM Book;

SELECT bookid, bookname, publisher, price
	FROM Book;