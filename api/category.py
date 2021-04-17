import db
from typing import List, Any, Dict


class Category:
    def __init__(self):
        self.table_name = "category"
        db.do_connect()
        self.create_table()

    def create_table(self):
        query = f"""
        CREATE TABLE IF NOT EXISTS {self.table_name} (id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY ( START 1 ),
        CONSTRAINT category_id PRIMARY KEY (id), name TEXT NOT NULL);
        """
        try:
            db.cursor.execute(query)
            return True
        except db.Error as error:
            return False

    def add(self, name: str) -> bool:
        query = f"INSERT INTO {self.table_name} (name) VALUES (%s)"
        try:
            db.cursor.execute(query, (name,))
            return True
        except db.Error as error:
            return False

    def update(self, category_id: int, category_name: str) -> bool:
        query = f"UPDATE {self.table_name} SET name=%s WHERE id=%s"
        try:
            db.cursor.execute(query, (category_name, category_id))
            return True
        except db.Error as error:
            return False

    def delete(self, category_id: int):
        query = f"DELETE FROM {self.table_name} WHERE id=%s"
        try:
            db.cursor.execute(query, (category_id,))
            return True
        except db.Error as error:
            return False

    def get(self, category_id: int) -> Dict:
        query = f"SELECT * FROM {self.table_name} WHERE id=%s"
        category_dict = {}
        try:
            db.cursor.execute(query, (category_id,))
            category: List[Any] = db.cursor.fetchone()
        except db.Error:
            return category_dict
        category_dict = {
            'id': category[0], 'name': category[1]
        }
        return category_dict

    def get_all(self) -> List:
        """ Get all of categories and return as a List """
        query = f"SELECT * FROM {self.table_name}"
        try:
            db.cursor.execute(query)
            categories: List[Any] = db.cursor.fetchall()
        except db.Error:
            return []
        categories_array = []
        for category in categories:
            category_dict = {
                'id': category[0], 'name': category[1]
            }
            categories_array.append(category_dict)
        return categories_array

    def count(self) -> int:
        query = f"SELECT count(*) FROM {self.table_name}"
        db.cursor.execute(query)
        count = db.cursor.fetchone()[0]
        return int(count)

    def exist(self, category_id: int) -> bool:
        query = f"SELECT COUNT (*) FROM {self.table_name} WHERE id=%s"
        db.cursor.execute(query, (category_id,))
        count = db.cursor.fetchone()[0]
        return int(count) > 0