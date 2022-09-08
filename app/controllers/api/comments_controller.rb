  # class Api::CommentsController < ApplicationController
  #   before_action :set_topic
  #   before_action :set_comment only: [:show, :update, :destroy]
  #   # model name is comment
  #   # follow the pattern to fill out controller
  #   # then change the parent and child relation
  #   # use callback before_action to clean up the code
  #   def index
  #     render json: @topic.comments
  #   end

  #   def show
  #     # @comment = @topic.comments.find(params[:id])
  #     render json: @comment
  #   end

  #   def create
  #     # @comment = Comments.new(comment_params)
  #     @comment = @topic.comments.new(comment_params)
  #     if @comment.save
  #       render json: @comment
  #     else 
  #       render json: { errors: @comment.errors },
  #       status: :unprocessable_entity
  #   end

  #   def update
  #     # @comment = @topic.comments.find(params[:id])
  #     if @comment.update(comment_params)
  #       render json: @comment
  #     else 
  #       render json: { errors: @comment.errors },
  #       status: :unprocessable_entity
  #   end

  #   def destroy
  #     # @comment = @topic.comments.find(params[:id]).destroy
  #     if @comment.destroy
  #     render json: {message: 'comment deleted'}
  #     else 
  #       rener json: {message: 'could not delete comment'}
  #   end

  #   private
  #     def set_topic
  #       @topic = Topic.find(params[:topic_id])
  #     end

  #     def set_comment
  #       @comment = @topic.comment.find(params[:id])
  #     end

  #     def comment_params
  #       params.require(:comment).permit(:body, :author)
  #     end
  # end

# 
class Api::CommentsController < ApplicationController
  # model name is comment 
  # follow the pattern to fill the controller out 
  # then change to the parent and child relationship  

  # optional, callback, before_action to clean up the show update and destroy
  before_action :set_topic
  before_action :set_comment, only: [:show, :update, :destroy]

  def index
    render json: @topic.comments 
  end

  def show
    render json: @comment 
  end

  def create
    @comment = @topic.comments.new(comment_params)
    if @comment.save
      render json: @comment
    else 
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else 
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    render json: { message: 'Comment deleted'}
  end

  private 
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_comment
      @comment = @topic.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:title, :body)
    end 
end