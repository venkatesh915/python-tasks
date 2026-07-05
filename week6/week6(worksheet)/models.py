from sqlalchemy import Boolean, Column, DateTime, Integer, String
from sqlalchemy.sql import func

from database import Base


class User(Base):
    __tablename__ = "jwt3"

    id = Column(Integer, primary_key=True, index=True)

    username = Column(String(100), unique=True, index=True, nullable=False)

    email = Column(String(150), unique=True, index=True, nullable=False)

    phone = Column(String(20), unique=True, nullable=False)

    password = Column(String(255), nullable=False)

    role = Column(String(20), nullable=False, default="user")

    otp = Column(String(6), nullable=True)

    otp_expiry = Column(DateTime, nullable=True)

    is_verified = Column(Boolean, default=False)

    # ✅ NEW: Soft delete flag
    is_deleted = Column(Boolean, default=False)

    created_at = Column(DateTime(timezone=True), server_default=func.now())