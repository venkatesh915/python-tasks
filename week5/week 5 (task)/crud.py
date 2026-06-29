from app.schema import User
from fastapi import HTTPException

banks = []
account_id_count = 1

def create_account(user :User):
    global account_id_count

    accounts = {
        "id" :account_id_count,
        "name" :user.name,
        "balance" : user.balance
    }
    banks.append(accounts)

    account_id_count +=1
    return {
        "message" : " account created", "account" :accounts
    }

def get_all_accounts():
    return banks

def get_account(account_id : int):
    for account in banks:
        if account["id"] == account_id:
            return account
    raise   HTTPException(status_code=404, detail= "not found")

def delete_account(account_id : int):
    for account in banks:
        if account["id"] == account_id:
            banks.remove(account)
    raise HTTPException(status_code=404, detail= "account not found")


        