-- �����Լ�, GROUP BY
-- ���� �ֹ��� ������ �� �Ǹž�

SELECT sum(saleprice) AS [�� ����]
	FROM Orders;


-- �迬�� ���� �ֹ��� ������ �� �Ǹž�
SELECT *
	FROM Customer;

-- �迬�ƴ� CUSTID 2���̴�

SELECT sum(saleprice) AS '�迬�ư� �� �Ǹž�'
	FROM Orders
	WHERE custid = 2;

-- count()�� * ����Ҽ� ����
-- �������� �����Լ��� �� �÷� �ϳ��� �����ؼ� ����Ұ�
Select COUNT(saleprice) AS [�ֹ�����], 
	SUM(saleprice) AS [�� �Ǹž�], 
	AVG(saleprice) AS [�Ǹž� ���], 
	MIN(saleprice) AS [�ֹ����� �ּұݾ�],
	MIN(saleprice) AS [�ֹ����� �ִ�ݾ�] 
	from Orders;

-- �����Ǽ�
SELECT COUNT(DISTINCT publisher) as [�ߺ�����] 
	from Book;

-- GROUP BY - �ʿ����� �׷��� �ؼ� ��� ��踦 ���� ����
-- GROUP BY���� ��� �ִ� �÷� �ܿ��� SELECT ���� ���� ���� ����
-- ��, SALEPRICE�� �����Լ��ȿ� ��������� ����
SELECT custid, SUM(saleprice) as '�Ǹž�'
	FROM Orders
	GROUP BY custid;
