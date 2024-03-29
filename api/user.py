from config import *
import db
from typing import List, Any
from sms_token import Token
from sms import SMS


class User(Token):
    def __init__(self):
        self.table_name = "the_user"
        db.do_connect()
        self.create_table()

    def __del__(self):
        db.disconnect()

    def create_table(self) -> bool:
        query = """
        CREATE TABLE IF NOT EXISTS """ + self.table_name + """(id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY ( 
        START 1 ), CONSTRAINT """ + self.table_name + """_id PRIMARY KEY (id), books integer [] not null default '{
        }', mobile TEXT 
        NOT NULL UNIQUE); """
        try:
            db.cursor.execute(query)
            return True
        except db.Error as error:
            return False

    def add(self, mobile: str) -> bool:
        try:
            query = f"INSERT INTO {self.table_name} (mobile) VALUES (%s)"
            db.cursor.execute(query, (mobile,))
            return True
        except db.Error as error:
            return False

    def add_book(self, user_id: int, book_id: int) -> bool:
        query = f"UPDATE {self.table_name} SET books=array_append(books,%s) WHERE id=%s"
        try:
            db.cursor.execute(query, (book_id, user_id))
            return True
        except db.Error:
            return False

    def update(self, user_id: int, user_mobile: str) -> bool:
        query = f"UPDATE {self.table_name} SET mobile=%s WHERE id=%s"
        try:
            db.cursor.execute(query, (user_mobile, user_id))
            return True
        except db.Error as error:
            return False

    def delete(self, user_id: int):
        query = f"DELETE FROM {self.table_name} WHERE id=%s"
        db.cursor.execute(query, (user_id,))
        return True

    def get_all(self) -> List:
        """ Get all of categories and return as a List """
        query = f"SELECT * FROM {self.table_name}"
        try:
            db.cursor.execute(query)
            users: List[Any] = db.cursor.fetchall()
        except db.Error:
            return []
        users_array = []
        for user in users:
            user_dict = {
                'id': user[0], 'books': user[1], 'mobile': user[2]
            }
            users_array.append(user_dict)
        return users_array

    def exist(self, mobile: str) -> bool:
        query = f"SELECT COUNT (*) FROM {self.table_name} WHERE mobile=%s;"
        db.cursor.execute(query, (mobile,))
        count = db.cursor.fetchone()[0]
        return int(count) > 0

    def request_login(self, mobile) -> bool:
        token = Token(mobile).create()
        # Send SMS containing Token to the mobile
        sms_result = SMS.send_token(token, mobile)
        if not IS_PRODUCTION:
            return True
        if len(sms_result) > 0 and sms_result['status'] == 200:
            return True
        else:
            return False

    def verify_login(self, mobile, user_token) -> bool:
        if not IS_PRODUCTION:
            return True
        if not self.exist(mobile):
            self.add(mobile)
        return Token(mobile).verify(user_token)
