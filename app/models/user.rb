class User < ApplicationRecord
    has_secure_password
    has_many :groups
    
    validates :email, format: { with: /@/, message: "must have an @"}, uniqueness: true
    validates :name, presence: true
    validates :username, presence: true
    validate :current_password_is_correct,
           if: :validate_password?, on: :update
    
    def self.new_from_hash(user_hash)
        user = User.new user_hash
        user.password_digest = 0
        user
    end
    
    def has_password?
        self.password_digest.nil? || self.password_digest !='0'
    end

  

  def current_password_is_correct
    if User.find(id).authenticate(current_password) == false
      errors.add(:current_password, "is incorrect.")
    end
  end

  def validate_password?
    !password.blank?
  end

  attr_accessor :current_password
    
end
