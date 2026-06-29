from fastapi import APIRouter, HTTPException
from app.schema import User
from app import crud

router = APIRouter(
    prefix = "/accounts",
    tags = ["Bank"]
)


@router.post("/")
def create_account(user : User):
    return crud.create_account(user)

@router.get("/")
def get_account():
    return crud.get_all_accounts()
@router.get("/{account_id}")
def get_account(account_id:int):
    return crud.get_account(account_id)

@router.delete("/{account_id}")
def delete_account(account_id : int):
    return crud.delete_account(account_id)

