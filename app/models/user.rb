class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  belongs_to :batch
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :careers, through: :project_members
  has_one_attached :avatar

  def full_name
    first_name + " " + last_name
  end
end
