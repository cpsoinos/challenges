class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(question_id: params[:id])
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = "Question added"
      redirect_to questions_path
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:notice] = "Question updated."
      redirect_to question_path(@question)
    else
      flash[:notice] = "Invalid entry"
      redirect_to edit_question_path(@question)
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: params[:id])
    if @question.destroy
      @answers.each do |answer|
        answer.destroy
      end
      flash[:notice] = "Question deleted."
      redirect_to questions_path
    end
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end

end
