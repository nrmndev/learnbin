class DiscoverController < ApplicationController
  before_action :discover_params, only: %i[index]
   # /discover  /views/discover/index.html.erb
  def index
    search_by = params[:search_by]
    query = params[:q]

  # optionally default behaviors
  if search_by.present? && query.present?
    case search_by
      when "user"
        @results = User.where("name ILIKE ?", "%#{query}%")
      when "topic"
        @results = Topic.where("title ILIKE ?", "%#{query}%")
      when "collection"
        grouped_cts = CollectionTopic.includes(:topic).all.group_by(&:collection_id)
        # Optionally load collections so you can show collection titles
        @results = Collection.where("title ILIKE ?", "%#{query}%").index_by(&:id).values

      else
        @results = []
      end
    else
    # no search criteria given — show fallback / all / none
    @results = []
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
