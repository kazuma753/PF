class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites
    attachment :image
    def self.search(search)
        return Post.all unless search
        return Post.where(['body LIKE ?', "%#{search}%"]),  User.where(['name LIKE ?', "%#{search}%"])
    end

    def user
        #インスタンスメソッドないで、selfはインスタンス自身を表す
        return User.find_by(id: self.user_id)
    end
end
