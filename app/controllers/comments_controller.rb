class CommentsController < ApplicationController
	
	def index
	end

	def new
		@comment = Comment.new
		@question = Question.find(params[:question_id])
	end

	def create
		@question = Question.find(params[:question_id])
		@comment = @question.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@comment = Comment.find(params[:id])
		@question = Question.find(params[:question_id])
	end

	def update
  		@comment = Comment.find(params[:id])
	  	if @comment.update(comment_params)
	  		redirect_to root_path
	  		# Takes us back to localhost:3000
	  	else
	  		render :edit
	  	end
  	end	

	def destroy
		@comment = Comment.find(params[:id]).destroy
  		redirect_to root_path
  	end

  	def upvote
		@question = Question.find(params[:question_id])
		@comment = @question.comments.find(params[:id])
		@comment.liked_by current_user
		redirect_to root_path
	end

	def downvote
	  	@question = Question.find(params[:question_id])
	  	@comment = @question.comments.find(params[:id])
	  	@comment.downvote_from current_user
		redirect_to root_path
	end

	private

	def comment_params
	  	params.require(:comment).permit(:text)
	  	# Sets it so that the params hash requires shirt key and image; ensures no one is hacking the site sending extra parameters
	  	# Security measure to prevent hacking
	end

end
