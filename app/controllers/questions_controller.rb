class QuestionsController < ApplicationController
  def index
    render json: { questions: Question.all
      # .pluck(:body) 
    }
  end

  def new
  end

  def show
    render json: Question.find(params[:id])
  end

  def create
    question = Question.create(params.require(:question).permit(:body, :test_id)).save
    render plain: question.inspect
  end

  def destroy
  end
end
