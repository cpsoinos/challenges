class QuestionsController < ApplicationController
  # def new
  #   @question = Question.new
  # end

  # def create
  #   @question = Question.create(question_params)
  #   if @question.save
  #     flash[:notice] = "Question submitted."
  #   else
  #     flash[:notice] = "Error. Try again."
  #   end
  #   redirect questions_path
  # end

  def index
    @questions = Question.all
  end

  # protected
  # def question_params
  #   params.require(:question).permit(:title, :description)
  # end

end
