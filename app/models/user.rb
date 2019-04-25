class User < ApplicationRecord
  has_many :comments, through: :chirps
  has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followee_id
  has_many :followers, through: :passive_relationships
  has_many :followees, through: :active_relationships
  has_many :comments
  has_many :chirps
  has_one_attached :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: {maximum: 30}
  validates :first_name, presence: true, length: {maximum: 30}
end
