class Review < ActiveRecord::Base
  belongs_to :book
  validates :rating, presence:true, numericality: true, length: {is: 1 }, inclusion:{in: 1..5}
  validates :body ,presence: true, length: {maximum: 500}
end
