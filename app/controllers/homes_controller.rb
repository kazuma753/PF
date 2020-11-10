class HomesController < ApplicationController
    def top
        @post = Post.new
        @posts = Post.all
        @comment = Comment.new
        @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    end

    def search
        # Viewのformで取得したパラメータをモデルに渡す
        # top と同じアクションの内容にする
        @posts,@users = Post.search(params[:search])
        @post = Post.new
        @comment = Comment.new
        @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
        render 'top'
    end

    def about
    end

    def create
        post = Post.find(params[:post_id])
        comment = current_user.comments.new(comment_params)
        comment.post_id = post.id
        comment.save
        redirect_to post_path(post)
        end

        def destroy
        post = Post.find(params[:id])  # データ(レコード)を1件取得
        post.destroy  # データ（レコード）を削除
        redirect_to request.referer  # リダイレクト 
        end
    
        private
        def comment_params
            params.require(:comment).permit(:comment, :image)
        end
end
