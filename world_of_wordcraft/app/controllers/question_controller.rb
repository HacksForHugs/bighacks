class QuestionController < ApplicationController

	def index
		@type = params[:type]
		if @type == "all"
				@questions = Question.where(level: current_user.level).order("RANDOM()").limit(10)
		else
			@questions = Question.where(level: current_user.level, type:@type).order("RANDOM()").limit(10)
		end
	end

	def new
		@question = Question.new
		@answer = Answer.new
	end

	def create
		@question = Question.new(question_params)

	end

	def question_params
		params.require(:question).permit(:question_text, :correct_answer_id, :type, :user_id)
	end

	def answer_params
		params.require(:answer).permit(:answer_text, :question_id)
	end
end
