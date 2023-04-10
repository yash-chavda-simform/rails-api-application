module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_article, only: [:show, :update, :destroy]
      def index
        @articles = Article.page(params[:page]).per(params[:per_page])
        render json: @articles 
      end
      
      def show
        render json: @article, status: :ok
      end

      def create
        @article = Article.new(article_params)
        if @article.save
          render json: @article, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity 
        end
      end
      
      def update
        if @article.update(article_params)
          render json: @article, status: :ok
        else
          render json: @article.errors, status: :unprocessable_entity
        end 
      end
      
      def destroy
        @article.delete
        render json: @article, status: :ok
      end
           
      def search
        @articles = Article.where('title LIKE ?', "%#{params[:name]}%")
        render json: @articles 
      end

      private
      def article_params
        params.require(:article).permit(:title, :body, :release_date)
      end
        
      def set_article
        @article = Article.find(params[:id])
      end
    end
  end
end
