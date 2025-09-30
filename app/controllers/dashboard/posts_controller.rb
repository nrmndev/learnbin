module Dashboard
  class PostsController < Dashboard::BaseController
    before_action :set_posts, only: %i[index]
    before_action :set_post, only: %i[show update]
    before_action :set_active_link

    def index
      if params[:search].present?
        @posts = @posts.search_by_title(params[:search])
      end

    end

    def show
      @part = Part.new
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

    def update
      @post.update!(post_params)
      redirect_to dashboard_posts_path
    end


    def new
      @post = Post.new
    end

    private


    def post_params
      params.require(:post).permit(:title, :slug, :description, topic_ids: [])
    end


    def set_post
      #@post = Post.friendly.find(params[:id])
      @post = Post.find(params[:id])
            #@post = Post.includes(:parts).find(params[:id])
      @posts_for_sidebar = @post.post_parts
    end

    # /dashboard/posts
    def set_posts
      @posts = Post
              .where(user_id: current_user.id)
              .order(title: :asc)
              .paginate(page: params[:page], per_page: 20)

      @topic_posts = @posts.includes(:topics).all
    end

    def set_active_link
      @active_link = 'posts'
    end
  end
end
