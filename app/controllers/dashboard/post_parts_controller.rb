module Dashboard
  class PostPartsController < Dashboard::BaseController
    before_action :set_post

    def move_up
      ct = @post.post_parts.find(params[:id])
      ct.move_higher
      redirect_to dashboard_post_path(@post)  # sends back to the collection#show page
    end

    def move_down
      ct = @post.post_parts.find(params[:id])
      ct.move_lower
      redirect_to dashboard_post_path(@post)
    end

    private

    def set_post
      #@topic = Topic.friendly.find(params[:topic_id])
      @post = Post.find(params[:post_id])
    end
  end
end
