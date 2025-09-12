module Dashboard
  class ArticlesController < ApplicationController
    before_action :set_topic, only: %i[index show]
    before_action :set_category, only: %i[index show]
    before_action :set_articles, only: %i[index show]
    # /dashboard/topics/:id/articles
    def index
    end

    #/dashboard/topics/3
    def show
      @article = @articles.find(params[:id])
      @section = Section.new
    end

    private
    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_articles
      @articles = @topic.articles
    end

    def set_category
      @category = @topic.category
    end
  end
end
