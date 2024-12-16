from typing import List
from sqlalchemy.orm import Session
from app.models import Todo as DBTodo
from app.schemas import *


def get_todo(db: Session, item_id: int):
    return db.query(DBTodo).filter(DBTodo.id == item_id).first()


def get_all_todo(db: Session) -> List[DBTodo]:
    # init_db()
    return db.query(DBTodo).all()


def create_todo(db: Session, item: Todo) -> Todo:
    db_item = DBTodo(message=item.message, tag=item.tag,
                     is_completed=item.is_completed)
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    return db_item


def update_todo(db: Session, db_item: DBTodo, item: Todo) -> Todo:
    db_item.message = item.message
    db_item.tag = item.tag
    db_item.is_completed = item.is_completed
    db.commit()
    db.refresh(db_item)
    return db_item


def delete_todo(db: Session, item_id: int) -> Todo:
    db_item = db.query(DBTodo).filter(DBTodo.id == item_id).first()
    db.delete(db_item)
    db.commit()
    return db_item
