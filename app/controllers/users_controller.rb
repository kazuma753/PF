class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update, :my]
    def my
        # @user = current_user
        @user = User.find(params[:id])
        @post = Post.new
        @posts = @user.posts
    end

    def following
        @user  = User.find(params[:id])
        @users = @user.followings
    end
    
    def followers
        @user  = User.find(params[:id])
        @users = @user.followers
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
            redirect_to my_user_path(@user),notice: 'ユーザー情報を変更しました！'
        else
            render :edit
        end
    end

    def destroy
        post = Post.find(params[:id])  # データ(レコード)を1件取得
        post.destroy  # データ（レコード）を削除
        redirect_to request.referer  # リダイレクト 
    end

    private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction, :favirite_machine)
    end

    def correct_user
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to my_user_path(current_user)
        end
    end

end
