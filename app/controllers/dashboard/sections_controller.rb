module Dashboard
  class SectionsController < ApplicationController
    before_action :set_section, only: %i[index show]
    # /dashboard/topics/:id/articles
    def index
    end

    #/dashboard/topics/3
    def show
      #@article = @articles.find(params[:id])
    end

    private
    def set_section
      @topic = Topic.find(params[:topic_id])
      @article = @topic.articles.find(params[:article_id])
      @section = @article.sections.find(params[:id])
    end
  end
end
