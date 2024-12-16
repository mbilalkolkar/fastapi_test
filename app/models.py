from sqlalchemy import Column, Integer, String, Boolean
from app.db import Base


class Todo(Base):
    __tablename__ = "Todo"

    id: int = Column(Integer, primary_key=True)  # , autoincrement=True)
    message: str = Column(String)
    is_completed: bool = Column(Boolean)
    tag: str = Column(String)
