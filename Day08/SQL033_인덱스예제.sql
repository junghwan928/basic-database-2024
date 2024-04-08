-- 지난주 잘못 만든 데이터를 전부 초기화 
-- 삭제
DELETE From Users;

-- 단, indentity(1,1)로 설정한 테이블에서 1부터 다시 넣도록 설정
-- 모두 지우고 테이블 초기화 까지
TRUNCATE TABLE Users;

-- 인덱스가 없는 상태
-- 100만건 정도 데티터 조회시 5~8초 사이 시간 소요

-- 인덱스를 걸기 위해서 userID 에 기본키 (PK)를설청
ALTER TABLE Users ADD PRIMARY KEY(userid)

-- username에 넌클러스터드 인덱스 설정
CREATE INDEX IX_Users_username on Users(username);

-- pk에 클러스터드 인덱스 설정됨

-- ! WHEREd에 검색을 위해서 username을 사용함
-- 인덱스를 PK에 걷는게 아니라 username 
CREATE CLUSTERED INDEX IX_Users_username on Users(username);

DROP INDEX IX_Users_username on Users;