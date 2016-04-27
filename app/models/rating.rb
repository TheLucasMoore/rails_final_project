class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  
  validates :rating, numericality: {less_than_or_equal_to: 5}
end
