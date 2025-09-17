
  class DashboardController < ApplicationController

    def index
      @grouped_cts = CollectionTopic.includes(:topic).all.group_by(&:collection_id)
     # Optionally load collections so you can show collection titles
      @collections = Collection.where(id: @grouped_cts.keys).index_by(&:id)
      @topics = Topic.all
    end
    # def topics
    #   @topics = Topic.all
    # end
  end
