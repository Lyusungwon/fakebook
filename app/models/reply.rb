class Reply < ActiveRecord::Base
    belongs_to :post
    belongs_to :users
    has_many :likes
    has_many :users, through: :likes
end
