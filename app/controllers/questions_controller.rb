class QuestionsController < ApplicationController

	def index
		@question = Question.all
	end

	def new
		@question = Question.new	
	end

	def create
		@question = Question.new(question_params)
	  	if @question.save
	  		redirect_to root_path
	  		# Takes us back to localhost:3000
	  	else
	  		render :new
	  	end
	end

	def edit
		@question = Question.find(params[:id])
	end

	def update
  		@question = Question.find(params[:id])
	  	if @question.update(question_params)
	  		redirect_to root_path
	  		# Takes us back to localhost:3000
	  	else
	  		render :edit
	  	end
  	end

  	def destroy
		@question = Question.find(params[:id]).destroy
  		redirect_to root_path
  	end

	private

	def question_params
	  	params.require(:question).permit(:title, :details, :user, :job, :firm, :category)
	  	# Sets it so that the params hash requires shirt key and image; ensures no one is hacking the site sending extra parameters
	  	# Security measure to prevent hacking
	end

end
