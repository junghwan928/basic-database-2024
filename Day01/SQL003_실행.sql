-- å�߿��� '�౸�� ����'��� ������ ���ǻ�� ������ �˰�;�/
-- DBO�� DATABASE OWNER
-- DML(4����) �� SELECT(��ȸ)
SELECT publisher, price 
	FROM Book
	WHERE bookname = '�౸�� ����';

/*
- SQL������ EQUAL �����ڿ� == ������
- ������ =

- SQL������ ��ҹ��� ���о���
- ������, Ű����� �빮�� ����� ��

- SQL������ ���ڿ��� " <- ������.
- ������ ' <- ���

- SQL������ ; <- �ʼ��� �ƴ�.
- ������, �߿��� ���׿����� ����Ұ�
*/

-- �迬�� ���� ��ȭ��ȣ�� ã���ÿ�

--- 1
SELECT * /* ALL */
	FROM Customer

--- 2
SELECT * /* ALL */
	FROM Customer
	WHERE [name] = '�迬��';

--- 3
SELECT phone /* ALL */
	FROM Customer
	WHERE [name] = '�迬��';