from pydantic import BaseModel, Field
from typing import Optional

class AccountCreate(BaseModel):
    name: str = Field(..., min_length=3)
    email: str
    balance: float = Field(..., gt=0)

class AccountUpdate(BaseModel):
    name: Optional[str] = None
    email: Optional[str] = None
    balance: Optional[float] = None