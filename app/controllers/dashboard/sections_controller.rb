module Dashboard
  class SectionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_section, only: %i[index show destroy move_down move_up]
    # /dashboard/topics/:id/articles
    def index
    end

    #/dashboard/topics/3
    def show
      #@article = @articles.find(params[:id])
    end

  def move_up
    @section.move_higher
    redirect_back(fallback_location: dashboard_category_topic_article_path(@article), notice: "Section moved up")
  end

  def move_down
    @section.move_lower
    redirect_back(fallback_location: dashboard_category_topic_article_path(@article), notice: "Section moved down")
  end

  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_category_topic_article_path(@article), notice: 'Article was successfully deleted.' }
      format.json { head :no_content }
    end
  end
    private
    def set_section
      @topic = Topic.find(params[:topic_id])
      @article = @topic.articles.find(params[:article_id])
      @section = @article.sections.find(params[:id])
    end
  end
end
