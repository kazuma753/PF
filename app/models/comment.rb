class Comment < ApplicationRecord
    validates :comment, presence: true
    validates :comment,    length: { maximum: 100 }
    belongs_to :user
    belongs_to :post
end
