from fastapi import FastAPI
from routers.account_router import router
from middleware.logger import log_request

app = FastAPI(title="Bank Management System")

app.middleware("http")(log_request)

app.include_router(router)

@app.get("/")
async def home():
    return {"message": "Bank Management System"}