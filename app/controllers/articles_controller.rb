class ArticlesController < ApplicationController
  before_filter :load_articles, except: [:index]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end