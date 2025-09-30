module Users
  class PartsController < ApplicationController
    before_action :set_post
    before_action :set_part, only: %i[show edit update destroy]
    before_action :set_prev, only: %i[show]
    before_action :set_next, only: %i[show]

    def index
      @parts = @post.parts
    end

    def show; end

    def new
      @part = @post.parts.new
    end

    def create
      @part = @post.parts.new(part_params)
      @part.user_id = current_user.id
      if @part.save
        redirect_to dashboard_post_path(@part.post_id), notice: "part created!"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @part.update(part_params)
        redirect_to dashboard_post_part_path(@part.post_id), notice: "part updated!"
      else
        render :edit
      end
    end

    def destroy
      @part.destroy
      redirect_to post_parts_path(@post), notice: "part deleted!"
    end


    private

    def set_post
      #@post = Post.friendly.find(params[:post_id])
      @post = Post.find(params[:post_id])
    end

    def set_part
      #@part = @post.parts.friendly.find(params[:id])
      @part = @post.parts.find(params[:id])
    end

    def part_params
      params.require(:part).permit(:title, :description, :position)
    end

    def set_prev
      pp = PostPart.find_by(post: @post, part: @part)
      if pp
        prev_pp = pp.higher_item
        @prev_part = prev_pp&.part
      else
        @prev_part = nil
      end
    end

    # Get the part with ID greater than current, the closest one
    def set_next
      pp = PostPart.find_by(post: @post, part: @part)
      if pp
        next_pp = pp.lower_item
        @next_part = next_pp&.part
      else
        @next_part = nil
      end
    end
  end
end
