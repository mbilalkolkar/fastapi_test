from sqlalchemy import Column, Integer, String, Boolean
from app.db import Base



class Todo(Base):
    __tablename__ = "Todo"

    id = Column(Integer, primary_key=True) #, autoincrement=True)
    message = Column(String)
    is_completed = Column(Boolean)
    tag = Column(String)

