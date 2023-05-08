class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :goal
end
