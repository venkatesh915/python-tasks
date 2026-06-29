from fastapi import APIRouter, HTTPException, Depends, BackgroundTasks

from schemas.account_schema import (
    AccountCreate,
    AccountUpdate
)

from services.account_services import (
    create_account_service,
    get_accounts_service,
    get_account_service,
    update_account_service,
    delete_account_service
)

from database.db import get_db

router = APIRouter()

def send_email():
    print("Email Sent")

@router.post("/accounts")
async def create_account(
    account: AccountCreate,
    background_tasks: BackgroundTasks
):
    background_tasks.add_task(send_email)
    return create_account_service(account)

@router.get("/accounts")
async def get_accounts(
    page: int = 1,
    limit: int = 5,
    search: str = "",
    db=Depends(get_db)
):
    return get_accounts_service(page, limit, search)

@router.get("/accounts/{account_id}")
async def get_account(account_id: int):

    account = get_account_service(account_id)

    if not account:
        raise HTTPException(
            status_code=404,
            detail="Account Not Found"
        )

    return account

@router.put("/accounts/{account_id}")
async def update_account(
    account_id: int,
    account: AccountUpdate
):
    updated = update_account_service(
        account_id,
        account
    )

    if not updated:
        raise HTTPException(
            status_code=404,
            detail="Account Not Found"
        )

    return updated

@router.delete("/accounts/{account_id}")
async def delete_account(account_id: int):

    deleted = delete_account_service(account_id)

    if not deleted:
        raise HTTPException(
            status_code=404,
            detail="Account Not Found"
        )

    return {"message": "Deleted Successfully"}