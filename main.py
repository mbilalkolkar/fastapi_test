from fastapi import FastAPI
from app.api_routes import router as todo_router
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Todo API",
    description="A simple todo API",
    version="1.0.0",
    swagger_ui_parameters={"tryItOutEnabled": True})


origins = [
    "http://localhost",
    "http://localhost:3000",
    "http://localhost:8000",
    "*"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
    expose_headers=["Content-Range"],

)

app.include_router(todo_router, prefix="/todo", tags=["todo"])

# if __name__ == "__main__":

#     from app.db import engine
#     from app.db import Base

#     def init_db():
#         Base.metadata.create_all(bind=engine)
#     init_db()

#     import uvicorn
#     uvicorn.run(app, host="0.0.0.0", port=8000, reload=True)
