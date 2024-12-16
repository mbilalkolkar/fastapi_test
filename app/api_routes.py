from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from app.api_crud import *
from app.schemas import *
from app.db import get_db

router = APIRouter()


@router.post("/", response_model=Todo)
def create_todo_api(item: TodoCreate, db: Session = Depends(get_db)) -> Todo:
    return create_todo(db=db, item=item)


@router.get("/{item_id}", response_model=Todo)
def read_todo(item_id: int, db: Session = Depends(get_db)) -> Todo:
    db_item = get_todo(db=db, item_id=item_id)
    if db_item is None:
        raise HTTPException(status_code=404, detail="Todo not found")
    return db_item


@router.get("/", response_model=List[Todo])
def read_todo(db: Session = Depends(get_db)) -> List[Todo]:
    db_item = get_all_todo(db=db)
    if db_item is None:
        raise HTTPException(status_code=404, detail="Todo not found")
    return db_item


@router.put("/{item_id}", response_model=Todo)
def update_todo_api(item_id: int, item: TodoCreate, db: Session = Depends(get_db)) -> Todo:
    db_item = get_todo(db=db, item_id=item_id)
    if db_item is None:
        raise HTTPException(status_code=404, detail="Todo not found")
    return update_todo(db=db, db_item=db_item, item=item)


@router.delete("/{item_id}", response_model=Todo)
def delete_todo_api(item_id: int, db: Session = Depends(get_db)) -> Todo:
    db_item = get_todo(db=db, item_id=item_id)
    if db_item is None:
        raise HTTPException(status_code=404, detail="Todo not found")
    return delete_todo(db=db, item_id=item_id)

# Add more routes as needed

from scripts.init_db import init_db

@router.get("/initdb/")
def init_database() -> str:
    init_db()
    return "done"
