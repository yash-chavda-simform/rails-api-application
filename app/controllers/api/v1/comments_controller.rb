module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: [:show, :update, :destroy]

      def index
        @comments = Comment.all
        render json: @comments 
      end
      
      def show
        render json: @comment, status: :ok
      end

      def create
        @comment = Comment.new(comment_params)
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity 
        end
      end
      
      def update
        if @comment.update(comment_params)
          render json: @comment, status: :ok
        else
          render json: @comment.errors, status: :unprocessable_entity
        end 
      end
      
      def destroy
        @comment.delete
        render json: @comment, status: :ok
      end

      def search
        @comments = Comment.where('content LIKE ?', "%#{params[:name]}%")
        render json: @comments 
      end
           
      private
      
      def comment_params
        params.require(:comment).permit(:content, :date_of_comment, :article_id)
      end
        
      def set_comment
        @comment = Comment.find(params[:id])
      end
    end
  end
end
