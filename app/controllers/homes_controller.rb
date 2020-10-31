class HomesController < ApplicationController
    def top
        @post = Post.new
        @posts = @post.user
        @posts = Post.all
        @comment = Comment.new
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
        end
    
        private
        def comment_params
            params.require(:comment).permit(:comment)
        end
end
