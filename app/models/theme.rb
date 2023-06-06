class Theme < ApplicationRecord
  has_many :goals
  
  def self.looks(search, word)
    if search == "perfect_match"
      @theme = Theme.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @theme = Theme.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @theme = Theme.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @theme = Theme.where("name LIKE?","%#{word}%")
    else
      @theme  = Theme.all
    end
  end
  
end
