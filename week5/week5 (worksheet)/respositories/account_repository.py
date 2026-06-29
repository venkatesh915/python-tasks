accounts = []

def add_account(account):
    accounts.append(account)
    return account

def get_all_accounts():
    return accounts

def get_account_by_id(account_id):

    for account in accounts:
        if account["id"] == account_id:
            return account

    return None

def update_account(
    account_id,
    account_data
):

    for account in accounts:

        if account["id"] == account_id:

            if account_data.name:
                account["name"] = account_data.name

            if account_data.email:
                account["email"] = account_data.email

            if account_data.balance:
                account["balance"] = account_data.balance

            return account

    return None

def delete_account(account_id):

    for account in accounts:

        if account["id"] == account_id:
            accounts.remove(account)
            return True

    return False