class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

  # attr_accessor :login

  validates :username, presence: true, uniqueness: true

  def admin
  	role == "admin"
  end
end
