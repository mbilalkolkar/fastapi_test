from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

SQLALCHEMY_DATABASE_URL = "sqlite:///./todo.db"

engine = create_engine(SQLALCHEMY_DATABASE_URL, echo=True)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# -----------------------------------------------------------
# old way to do
# from sqlalchemy.ext.declarative import declarative_base

# Base = declarative_base()


# new way to do same 
from sqlalchemy.orm import DeclarativeBase

class Base(DeclarativeBase):
    pass
