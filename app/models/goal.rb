class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  
  enum status: ["すでに決まっている", "考え中", "何も考えていない", "すでに達成した"]
end
