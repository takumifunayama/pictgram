class User < ApplicationRecord
    validates :name, presence: true, length:{maximum: 15}
    validates :email, presence: true
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password, length:{in:8..32}
    #validates :password, format:{with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
    
    has_secure_password
end
