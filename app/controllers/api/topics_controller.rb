class Api::TopicsController < ApplicationController
  # define who the parent is in a child controller 
  before_action :set_sub 
  #  next we need to change all the Model_name to @parent.children(s)

  # clean up the common cold 
  before_action :set_topic, only: [:show, :update, :destroy]

  # model name = topic 
  def index
    # render json: Topic.all (before)
    render json: @sub.topics #(after)
  end

  def show
    # @topic = Topic.find(params[:id])
    # @topic = @sub.topics.find(params[:id])
    render json: @topic 
  end

  def create
    # @topic = Topic.new(topic_params)
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      render json: @topic
    else 
      render json: { errors: @topic.errors }, 
      status: :unprocessable_entity
    end
  end

  def update
    # @topic = Topic.find(params[:id])
    # @topic = @sub.topics.find(params[:id])
    if @topic.update(topic_params)
      render json: @topic
    else 
      render json: { errors: @topic.errors },
      status: :unprocessable_entity
    end
  end

  def destroy
    # @topic = Topic.find(params[:id])
    # @topic = @sub.topics.find(params[:id])
    @topic.destroy
    render json: { message: 'topic deleted'}
  end

  private 
    # define who the parent is 
    def set_sub
      @sub = Sub.find(params[:sub_id])
    end

    def set_topic
      @topic = @sub.topics.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :body)
    end 
end









