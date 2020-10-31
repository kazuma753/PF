class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        # def posts
        #   return Post.where(user_id: self.id)
        # end

        has_many :posts, dependent: :destroy
        has_many :comments, dependent: :destroy
        has_many :favorites, dependent: :destroy
        attachment :profile_image 

end
