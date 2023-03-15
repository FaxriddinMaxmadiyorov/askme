class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show update edit destroy]
  def create
    byebug
    question = Question.create(question_params)

    # flash['notice'] = 'new question created'
    redirect_to question_path(question), notice: 'question created'
  end

  def update
    @question.update(question_params)
    redirect_to question_path(@question), notice: 'question updated'
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: 'question deleted'
  end

  def show
  end

  def index

    # zFngFIVzNXXxhbVz3SILlZFfNK8dGedoUScFtFLXmsW3qrdqfEhtyfcIl9IQY02LzdT92U5Xvvdnb45ZvIYQRA
    @question = Question.new
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def hello
    @question = Question.new
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
