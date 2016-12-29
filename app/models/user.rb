class User < ApplicationRecord
  enum role: [:user, :manager, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :credits
  has_many :requests

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :email, presence: true
  validates :email, format: /@/
  validates :name, presence: true
end
