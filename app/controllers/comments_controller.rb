class CommentsController < ApplicationController


    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.new(comment_params)
        @comment.post_id = @post.id
        if @comment.save
        redirect_to request.referer
        else
            @post = Post.find(params[:post_id])
            @comments = @post.comments
            render 'posts/show'
        end
    end

    def destroy
        post = Comment.find(params[:post_id])  # データ(レコード)を1件取得
        post.destroy  # データ（レコード）を削除
        redirect_to request.referer  # リダイレクト 
    end

    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
