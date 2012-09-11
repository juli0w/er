class HomeController < ApplicationController
  before_filter :load_articles

  def index
  end

  def institucional
  end

  def clientes
  end

  def riscos
  end

  def seguranca
  end

private

  def load_articles
    @articles = Article.last(5)
  end
end
