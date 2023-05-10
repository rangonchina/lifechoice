class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  enum status: ["すでに決まっている", "考え中", "何も考えていない", "すでに達成した"]
  
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
