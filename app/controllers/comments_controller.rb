class CommentsController < ApplicationController
	def create
		@link = Link.find(params[:link_id])
		@comment = @link.comments.new(comment_params)

		@comment.user_id = current_user.id
		@comment.save
		
		redirect_to link_path(@link), :flash => { :success => "コメントしました" }
	end

	def upvote
		@comment = Comment.find(params[:id])
	    if current_user
	      @comment.vote_by voter: current_user, :vote => 'upvote'
	    else
	      redirect_to :back, notice: "ログインが必要です"
	      return
	    end

	    redirect_to :back
	end



	private

	def comment_params
		params.require(:comment).permit(:body, :user_id)
	end
end
