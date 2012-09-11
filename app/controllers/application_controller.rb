class ApplicationController < ActionController::Base
  protect_from_forgery

protected
  
  def load_articles
    @articles = Article.last(5)
  end
end
