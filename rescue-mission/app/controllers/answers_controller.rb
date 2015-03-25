class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      flash[:notice] = "Answer added."
    else
      flash[:notice] = "Answer must be more than 50 characters!"
    end
    redirect_to question_path(@answer.question_id)
  end

  protected
  def answer_params
    params.require(:answer).permit(:question_id, :description)
  end

end
