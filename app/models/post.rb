class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :location, presence: true
  validates :text, presence: true
  validates :postimage, presence: true
  validates :address , presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  mount_uploader :postimage, PostimageUploader

  geocoded_by :address
  after_validation :geocode
end
