
  class DiscoverController < ApplicationController
    before_action :discover_params, only: %i[index]
    def index
      permitted_params = params.permit(:search_by, :q)
      @search_by = permitted_params[:search_by]
      @q = permitted_params[:q]

      respond_to do |format|
        format.html   # normal load
        format.turbo_stream  # optional, if you want it
      end
    end
    # def topics
    #   @topics = Topic.all
    # end
    private
    def discover_params
      params.permit(:search_by, :q)
    end
  end
