class UserRole < ApplicationRecord
    has_many :user_role_transactions, dependent: :destroy
end
