module Dashboard
  class TopicPostsController < Dashboard::BaseController
    before_action :set_topic

    def move_up
      ct = @topic.topic_posts.find(params[:id])
      ct.move_higher
      redirect_to dashboard_topic_path(@topic)  # sends back to the collection#show page
    end

    def move_down
      ct = @topic.topic_posts.find(params[:id])
      ct.move_lower
      redirect_to dashboard_topic_path(@topic)
    end

    private

    def set_topic
      #@topic = Topic.friendly.find(params[:topic_id])
      @topic = Topic.find(params[:topic_id])
    end
  end
end
