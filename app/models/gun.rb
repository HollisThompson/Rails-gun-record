class Gun < ApplicationRecord
     belongs_to :user
     validates :model, presence: true
     validates :condition, presence: true
     validates :year, presence: true
end
