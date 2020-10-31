class UsersController < ApplicationController
    def my
        # @user = current_user
        @user = User.find(params[:id])
        @post = Post.new
        @posts = @user.posts
    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts

    end

    def update
        @user = User.find(params[:id])#ユーザーの情報を特定する
      if @user.update(user_params)#更新する
        redirect_to my_user_path(@user.id),notice: 'You have updated user successfully.'
        else 
        render :edit
      end
    end

    private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction, :favirite_machine)
    end
end
