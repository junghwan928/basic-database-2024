# 파이썬 DB 연동 프로그램

import sys
from PyQt5 import uic
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QCloseEvent
from PyQt5.QtWidgets import *
from PyQt5.QtGui import *
import webbrowser
## MSSQL 연동할 라이브러리(모듈)
import pymssql

## 전역변수(나중에 변경시 여기만 변경하면 됨)
serverName = '127.0.0.1'
userId = 'sa'
userPass = 'mssql_p@ss'
dbName = 'Madang'
dbCharset = 'UTF8'

# 저장버튼 클릭 시 삽입, 수정을 구분짓기 위한 구분자
mode = 'I' # U / I:Insert, U:Update

from PyQt5.QtWidgets import QWidget

class qtApp(QMainWindow):
    def __init__(self, ) -> None:
        super().__init__()
        uic.loadUi('./day06/Madangbook.ui', self)
        self.initUI()

    def initUI(self) -> None:
        # 입력제한
        self.txtBookId.setValidator(QIntValidator(self)) # 숫자만 입력하도록 제한
        self.txtPrice.setValidator(QIntValidator(self)) # 숫자만 입력하도록 제한
        # Button 4개에 대해서 사용등록
        self.btnNew.clicked.connect(self.btnNewClicked) # 신규버튼 시그널(이벤트)에 대한 슬롯함수 생성
        self.btnSave.clicked.connect(self.btnSaveClicked) # 저장버튼
        self.btnDel.clicked.connect(self.btnDelClicked) # 삭제버튼
        self.btnReload.clicked.connect(self.btnReloadClicked) # 조회버튼
        self.tblBooks.itemSelectionChanged.connect(self.tblBooksSelected) # 테이블위젯 결과를 클릭시 발생
        self.show()

        self.btnReloadClicked() 
    
    def btnNewClicked(self): # 신규버튼 클릭
        global mode # 전역변수 사용
        mode = 'I'
        self.txtBookId.setText('')
        self.txtBookName.setText('')
        self.txtPublisher.setText('')
        self.txtPrice.setText('')
        self.txtBookId.setEnabled(True) # 사용

    def btnSaveClicked(self): # 저장버튼 클릭
        # 입력검증(Validation Check) 반드시
        # 1. 텍스트박스를 비워두고 저장버튼 누르면 안됨
        bookid = self.txtBookId.text()
        bookName = self.txtBookName.text()
        publisher = self.txtPublisher.text()
        price = self.txtPrice.text()

        # print(bookid, bookName, publisher, price)
        warningMsg = '' # 경고메시지
        isValid = True # 빈 값이 있으면 False로 변경
        if bookid == None or bookid == '':
            warningMsg += '책 번호가 없습니다.\n'
            isValid = False
        if bookName == None or bookName == '':
            warningMsg += '책 제목이 없습니다.\n'
            isValid = False
        if publisher == None or publisher == '':
            warningMsg += '출판사가 없습니다.\n'
            isValid = False
        if price == None or price == '':
            warningMsg += '정가가 없습니다.\n'
            isValid = False

        if isValid == False: # 위 입력값 중에 하나라도 빈 값이 존재
            QMessageBox.warning(self, '경고', warningMsg)
            return

        ## mode = 'I'일 때는 중복번호를 체크해야 하지만, mode = 'U'일 때는 체크해서 막으면 수정 자체가 안됨
        if mode == 'I': # INSERT 경우
            # 2. 현재 존재하는 번호를 사용했는지 체크, 이미 있는 번호면 DB입력 쿼리 실행이 안되도록 막아야 함
            conn = pymssql.connect(server = serverName, user = userId, password = userPass, database = dbName, charset = dbCharset)
            cursor = conn.cursor(as_dict = False) # COUNT(*)는 데이터가 딱 1개이기 때문에 as_dict = False로 해야함

            query = f'''SELECT COUNT(*)
                        FROM Book
                        WHERE bookid = {bookid}''' # 현재 입력하고자하는 번호가 있는지 확인 쿼리
            cursor.execute(query)
            # print(cursor.fetchone()[0]) # COUNT(*)는 데이터가 딱 1개이기 때문에 cursor.fetchone() 함수로 (1, ) 튜플을 가져옴
            valid = cursor.fetchone()[0]
            conn.close()

            if valid == 1: # DB Book테이블에 같은 번호가 이미 존재
                QMessageBox.warning(self, '경고', '같은 번호의 데이터가 존재합니다!!\n번호를 변경하세요.')
                return # 함수 탈출

        ## 3. 입력검증 후 DB Book테이블에 삽입 시작
        # bookid, bookName, publisher, price
        if mode == 'I':
            query = f'''INSERT INTO Book
                        VALUES ({bookid}, N'{bookName}', N'{publisher}', {price})'''
            
        elif mode == 'U': # 수정
            query = f'''UPDATE Book
                           SET bookname = N'{bookName}'
                             , publisher = N'{publisher}'
                             , price = {price}
                            WHERE bookid = {bookid}'''

        conn = pymssql.connect(server = serverName, user = userId, password = userPass, database = dbName, charset = dbCharset)
        cursor = conn.cursor(as_dict = False) # INSERT는 데이터를 가져오는게 아니라서

        try:
            cursor.execute(query)
            conn.commit() # 저장을 확립

            if mode == 'I':
                QMessageBox.about(self, '저장성공', '데이터를 저장했습니다.')
            else:
                QMessageBox.about(self, '수정성공', '데이터를 수정했습니다.')
        except Exception as e:
            QMessageBox.warning(self, '저장실패', f'{e}')
            conn.rollback() # 저장이 실패하면 원상복귀
        finally:
            conn.close() # 오류가 나든 안나든, DB는 닫는다

        self.btnReloadClicked() # 조회버튼 클릭 함수만 실행하면 

    def btnDelClicked(self): # 삭제버튼 클릭
        # 삭제기능
        bookid = self.txtBookId.text()
        # Validation Check
        if bookid == None or bookid == '':
            QMessageBox.warning(self, '삭제경고', '책 번호 없이 삭제할 수 없습니다.')
            return
        
        ## 삭제 시 삭제여부를 물어봐야 함
        re = QMessageBox.question(self, '삭제여부', '정말로 삭제하시겠습니까?', QMessageBox. Yes | QMessageBox.No)
        if re == QMessageBox.No:
            return
        
        conn = pymssql.connect(server = serverName, user = userId, password = userPass, database = dbName, charset = dbCharset)
        cursor = conn.cursor(as_dict = False)
        query = f'''DELETE FROM Book
                     WHERE bookid = {bookid}'''

        try:
            cursor.execute(query)
            conn.commit()
            QMessageBox.about(self, '삭제성공', '데이터를 삭제했습니다.')
        except Exception as e:
            QMessageBox.warning(self, '삭제실패', f'{e}')
            conn.rollback()
        finally:
            conn.close()

        self.btnReloadClicked() # 삭제 후에도 재조회 해야함

    def btnReloadClicked(self): # 조회버튼 클릭
        lstResult = []
        conn = pymssql.connect(server = serverName, user = userId, password = userPass, database = dbName, charset = dbCharset)
        cursor = conn.cursor(as_dict = True)

        query = '''
                SELECT bookid
                    ,bookname
                    ,publisher
                    ,ISNULL(FORMAT(price, '#,#'), '0') AS price
                FROM Book
                '''
        cursor.execute(query)
        for row in cursor:
            # print(f'bookid = {row["bookid"]}, bookname = {row["bookname"]}, publisher = {row["publisher"]}, price = {row["price"]}')
            # dictionary로 만든 결과를 lstResult에 append()
            temp = { 'bookid' : row["bookid"], 'bookname' : row["bookname"], 'publisher' : row["publisher"], 'price' : row["price"] }
            lstResult.append(temp)
        
        conn.close() # DB는 접속해서 일이 끝나면 무조건 닫음

        # print(lstResult) # tblBooks 테이블위젯에 표시
        self.makeTable(lstResult)

    def makeTable(self, data): # tblBooks 위젯을 데이터와 컬럼 생성해주는 함수
        self.tblBooks.setColumnCount(4) # bookid, bookname, publisher, price
        self.tblBooks.setRowCount(len(data)) # 조회에서 나온 리스트의 갯수로 결정
        self.tblBooks.setHorizontalHeaderLabels(['책 번호', '책 제목', '출판사', '정가']) # 컬럼이 설정

        n = 0
        for item in data:
            # print(item) # 디버깅에는 필요
            idItem = QTableWidgetItem(str(item['bookid']))
            idItem.setTextAlignment(Qt.AlignmentFlag.AlignRight | Qt.AlignmentFlag.AlignVCenter)
            self.tblBooks.setItem(n, 0, idItem) # set(row, column, str type text)
            self.tblBooks.setItem(n, 1, QTableWidgetItem(item['bookname'])) # set(row, column, text)
            self.tblBooks.setItem(n, 2, QTableWidgetItem(item['publisher'])) # set(row, column, text)
            priceItem = QTableWidgetItem(str(item['price']))
            priceItem.setTextAlignment(Qt.AlignmentFlag.AlignRight | Qt.AlignmentFlag.AlignVCenter)
            self.tblBooks.setItem(n, 3, priceItem) # set(row, column, str type text)

            n += 1

        self.tblBooks.setColumnWidth(0, 65) # 책 번호 컬럼 넓이
        self.tblBooks.setColumnWidth(1, 230) # 책 이름 컬럼 넓이
        self.tblBooks.setColumnWidth(2, 130) # 출판사 컬럼 넓이
        self.tblBooks.setColumnWidth(3, 80) # 정가 컬럼 넓이

        # 컬럼 더블클릭 금지
        self.tblBooks.setEditTriggers(QAbstractItemView.NoEditTriggers)

    def tblBooksSelected(self): # 조회결과 테이블위젯 내용 클릭
        rowIndex = self.tblBooks.currentRow() # 현재 마우스로 선택된 행의 인덱스

        bookId = self.tblBooks.item(rowIndex, 0).text() # 책 번호
        bookName = self.tblBooks.item(rowIndex, 1).text() # 책 제목
        publisher = self.tblBooks.item(rowIndex, 2).text() # 출판사
        price = self.tblBooks.item(rowIndex, 3).text().replace(',', '') # 정가
        # print(bookId, bookName, publisher, price) # 나중에 디버깅 시 필요

        # 지정된 lineEdit(TextBox)에 각각 할당
        self.txtBookId.setText(bookId)
        self.txtBookName.setText(bookName)
        self.txtPublisher.setText(publisher)
        self.txtPrice.setText(price)
        # 모드를 Update로 변경
        global mode # 전역변수를 내부에서 사용
        mode = 'U'
        # txtBookId를 사용하지 못하게 설정
        self.txtBookId.setEnabled(False)

    # 원래 PyQt에 있는 함수 closeEvent를 재정의(Override)
    def closeEvent(self, event) -> None:
        re = QMessageBox.question(self, '종료여부', '종료하시겠습니까?', QMessageBox.Yes | QMessageBox.No)
        if re == QMessageBox.Yes:
            event.accept() # 완전히 꺼짐
        else:
            event.ignore()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    inst = qtApp()
    sys.exit(app.exec_())    
