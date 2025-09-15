
  class DiscoverController < ApplicationController

    def index
      search_term = params.dig(:search, :q)
      if search_term.present?
        @topics = Topic.where("name ILIKE ?", "%#{search_term}%")
      else
        @topics = Topic.none
      end


      respond_to do |format|
        format.html   # normal load
        format.turbo_stream  # optional, if you want it
      end
    end
    # def topics
    #   @topics = Topic.all
    # end
  end
