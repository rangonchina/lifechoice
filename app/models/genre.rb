class Genre < ApplicationRecord
  belongs_to :goals
  belongs_to :theme 
end
