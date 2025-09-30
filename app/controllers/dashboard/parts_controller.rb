module Dashboard
  class PartsController < Dashboard::BaseController
    before_action :authenticate_user!
    before_action :set_part, only: %i[index show destroy move_down move_up update]

    def index; end
    def show; end

    def update
      @part.update!(part_params)
      redirect_to dashboard_post_path(@part.post_id)
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
      #@post = Post.friendly.find(params[:post_id])
      @post = Post.find(params[:post_id])
      @parts = @post.parts
      #@part = Part.friendly.find(params[:id])
      @part = Part.find(params[:id])
    end

    def part_params
      params.require(:part).permit(:title, :description)
    end
  end
end
