class ArticlesController < ApplicationController
  before_action :set_topic
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = @topic.articles
  end

  def show; end

  def new
    @article = @topic.articles.new
  end


  def create
    @article = @topic.articles.new(article_params)
    if @article.save
      redirect_to dashboard_category_topic_path(@topic.category, @topic), notice: "Article created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to [@topic, @article], notice: "Article updated!"
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to topic_articles_path(@topic), notice: "Article deleted!"
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_article
    @article = @topic.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :slug, :summary)
  end
end
