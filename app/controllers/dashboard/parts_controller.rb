module Dashboard
  class PartsController < Dashboard::BaseController
    before_action :authenticate_user!
    before_action :set_parts, only: %i[index show destroy move_down move_up update]
    before_action :set_part, only: %i[show update]
    before_action :set_active_link

    def new
      @part = Part.new
    end

    def index; end
    def show; end
    def create
      @part = Part.new(part_params)
      @part.user = current_user
      @part.save!
      redirect_to dashboard_parts_path
    end

    def update
      @part.update!(part_params)
      redirect_to dashboard_part_path(@part)
    end

    def move_up
      @parts.move_higher
      redirect_to dashboard_post_path(@post)
    end

    def move_down
      @parts.move_lower
      redirect_to dashboard_post_path(@post)
    end

    def destroy
      @parts.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_post_path(@post), notice: 'Article was successfully deleted.' }
        format.json { head :no_content }
      end
    end

    private

    def set_part
      #@post = Post.friendly.find(params[:id])
      @part = Part.find(params[:id])
    end

    def set_parts
      @parts = Part
        .where(user_id: current_user.id)
        .order(title: :asc)
        .paginate(page: params[:page], per_page: 20)

      @post_parts = @parts.includes(:posts).all
    end

    def part_params
      params.require(:part).permit(:title, :description, post_ids: [])
    end

    def set_active_link
      @active_link = 'parts'
    end
  end
end
