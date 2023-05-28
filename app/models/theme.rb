class Theme < ApplicationRecord
  has_many :goals
  has_many :genre, dependent: :destroy
end
