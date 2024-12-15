from typing import Union # provides runtime support for type hints.
from pydantic import BaseModel

class TodoBase(BaseModel):
    message:str
    is_completed:bool
    tag:Union[str, None] = None
    
class TodoCreate(TodoBase):
    pass    

class Todo(TodoBase):
    id:int

    class Config:
        from_attributes = True