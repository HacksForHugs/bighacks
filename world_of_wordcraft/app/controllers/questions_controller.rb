class QuestionsController < ApplicationController

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
    a1content = params[:a1]
    a2content = params[:a2]
    a3content = params[:a3]
    @a1 = Answer.build(answer_text: a1content)
    @a2 = Answer.build(answer_text: a2content)
    @a3 = Answer.build(answer_text: a3content)
    correct = params[:correct_id]
    if @a1.save and @a2.save and @a3.save
      case correct
      when 1
        correct_id = @a1.id
      when 2
        correct_id = @a2.id
      when 3
        correct_id = @a3.id
      else
        correct_id = nil
      end
      question_params[:correct_answer_id] = correct_id
      @question = Question.build(question_params)
      if @question.save
        #redirect_to #USER DASHBOARD
      end
    end
  end

  def question_params
    params.require(:question).permit(:question_text, :type, :user_id, :level)
  end

  def answer_params
    params.require(:answer).permit(:answer_text, :question_id)
  end
end
