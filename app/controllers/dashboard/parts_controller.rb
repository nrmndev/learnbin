module Dashboard
  class PartsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_part, only: %i[index show destroy move_down move_up]
    # /dashboard/topics/:id/articles
    def index
    end

    #/dashboard/topics/3
    def show
      #@article = @articles.find(params[:id])
    end

  def move_up
    @parts.move_higher
    redirect_back(fallback_location: dashboard_topic_post_path(@post), notice: "Section moved up")
  end

  def move_down
    @parts.move_lower
    redirect_back(fallback_location: dashboard_topic_post_path(@post), notice: "Section moved down")
  end

  def destroy
    @parts.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_topic_post_path(@post), notice: 'Article was successfully deleted.' }
      format.json { head :no_content }
    end
  end
    private
    def set_part
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @parts = @post.parts.find(params[:id])
      @part = Part.find(params[:id])
    end
  end
end
