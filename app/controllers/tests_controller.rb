class TestsController < ApplicationController
  def index
    # byebug
    # render plain: 'Hello world!'
    # render inline: '<%=console%>'

    render json: {tests: Test.all}
  end

  def show
    render json: Test.find(params[:id])
  end

  def new
  end
end
