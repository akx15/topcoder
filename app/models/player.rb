class Player < ActiveRecord::Base
validates_presence_of :rating
  validates_numericality_of :rating
  validates_presence_of :volatility
  validates_numericality_of :volatility
  
end
