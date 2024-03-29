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

-- �������� ���ǻ縦 �˻��Ͻÿ� (�ߺ�����)
SELECT DISTINCT publisher
	FROM Book;

-- ���ǰ˻�(���� ������ ���)
-- WHERE �� = ������ 2���� �̸��� ������ �˻��Ͻÿ�

SELECT * 
	FROM Book
	where price < 20000;

-- ������ 1���� �̻�, 2���� ������ ������ �˻�
SELECT *
	FROM Book
	WHERE price BETWEEN 10000 AND 20000;

-- ���ǻ簡 �½������� ���ѹ̵�� ������ �˻�
SELECT *
	FROM Book
	WHERE publisher IN ('�½�����', '���ѹ̵��');

-- ���ǻ簡 �½������� ���ѹ̵�� �ƴ� ������ �˻�
SELECT *
	FROM Book
	WHERE publisher NOT IN ('�½�����', '���ѹ̵��');

-- �౸�� ���縦 ������ ���ǻ� �˻�
SELECT bookname, publisher
	FROM Book
	WHERE bookname = '�౸�� ����';

-- ���� �̸��� �౸�� ���Ե� ���ǻ縦 �˻�
SELECT bookname, publisher
	FROM Book
	WHERE bookname LIKE '�౸%'; -- �౸��� ���ڷ� ����


SELECT bookname, publisher
	FROM Book
	WHERE bookname LIKE '%�౸'; -- �౸��� ���ڷ� ��


SELECT bookname, publisher
	FROM Book
	WHERE bookname LIKE '%�౸%'; -- �౸��� ���ڷ� ���۰� ��


-- �α��ڿ� ���� ������ �ܾ�� ���۵Ǵ� ���� �̸��� ���Ե� ���ǻ縦 �˻�
SELECT bookname, publisher
	FROM Book
	WHERE bookname LIKE '_��%'; -- _(�������ڵ� �ѱ��ڰ� ��) �� ��� ���ڷ� ����