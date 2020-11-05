class PostsController < ApplicationController
    before_action :correct_user, only: [:edit, :update, :destroy]
    def new
        @post = Post.new
    end

    def show
        @comment = Comment.new
        @post = Post.find(params[:id])
        @comments = @post.comments
        @user = @post.user
    end

    def index
        @post = Post.find(params[:id])
        @comments = @post.comments
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to my_user_path(current_user.id), notice: 'You have creatad book successfully.'
        else
            redirect_to request.referer #元いたページに遷移する
        end
    end

    def destroy
        post = Post.find(params[:id])  # データ(レコード)を1件取得
        post.destroy  # データ（レコード）を削除
        redirect_to request.referer  # リダイレクト 
    end

        private
        # ストロングパラメータ
        def post_params
            params.require(:post).permit(:body, :image, :profile_image)
        end

        def correct_user
            unless Post.find(params[:id]).user.id.to_i == current_user.id
                redirect_to request.referer
            end
        end

end
