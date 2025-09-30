module Dashboard
  class PostsController < Dashboard::BaseController
    # before_action :set_topic, only: %i[index show]
    # before_action :set_category, only: %i[index show]
    before_action :set_posts, only: %i[index]
    before_action :set_post, only: %i[show update]
    before_action :set_active_link
    # /dashboard/posts
    def index
      if params[:search].present?
        @posts = @posts.search_by_title(params[:search])
      end

    end

    def show
      @part = Part.new # need for (add part button)
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user = current_user
      @post.save!
      redirect_to dashboard_posts_path
    end
    # /dashboard/posts/:id (update post button)
    def update
      @post.update!(post_params)
      redirect_to dashboard_posts_path
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
      #@post = Post.friendly.find(params[:id])
      @post = Post.find(params[:id])
    end

    # /dashboard/posts
    def set_posts
      @posts = Post
              .where(user_id: current_user.id)
              .order(title: :asc)
              .paginate(page: params[:page], per_page: 5)

      @topic_posts = @posts.includes(:topics).all
    end

    def set_active_link
      @active_link = 'posts'
    end
  end
end
