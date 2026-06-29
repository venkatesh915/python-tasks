from fastapi import FastAPI
from app.routes import bank
app = FastAPI(
    title = "Bank API"
)

app.include_router(bank.router)
@app.get("/")
def home():
    return {
        "message": "Welcome"
    }