module Dashboard
  class PostsController < Dashboard::BaseController
    # before_action :set_topic, only: %i[index show]
    # before_action :set_category, only: %i[index show]
    before_action :set_posts, only: %i[index]
    before_action :set_post, only: %i[show update]
    before_action :set_active_link
    # /dashboard/posts
    def index; end

    def show
      @part = Part.new # need for (add part button)
    end

    # /dashboard/posts/:id (update post button)
    def update
      if @post.update!(post_params)
        flash.now[:notice] = "Post updated successfully!"
        render turbo_stream: [
          turbo_stream.replace("turbo_dashboard_edit_title", partial: "dashboard/shared/title", locals: { title: @post.title }),
          # turbo_stream.append("flash", partial: "layouts/flash")
        ]
        # redirect_to dashboard_post_path(@post), notice: "part updated!"
      end
    end

    # /dashboard/posts/new (create post button)
    def new
      @post = Post.new
    end

    private

    # accepts topic_id array and saves through topic_posts
    def post_params
      params.require(:post).permit(:title, :slug, :description, topic_ids: [])
    end

    # /dashboard/posts/:id
    def set_post
      @post = Post.find(params[:id])
    end

    # /dashboard/posts
    def set_posts
      @posts = Post.where(user: current_user)
      @topic_posts = @posts.includes(:topics).all
    end

    def set_active_link
      @active_link = 'posts'
    end
  end
end
