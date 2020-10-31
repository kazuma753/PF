class Home < ApplicationRecord
    has_many :comments, dependent: :destroy
end
