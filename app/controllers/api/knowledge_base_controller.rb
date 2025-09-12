module Api
  class KnowledgeBaseController < ApplicationController
    def index
      # Include nested associations for JSON
      categories = Category.includes(topics: { articles: :sections }).all

      render json: categories.as_json(
        only: [:id, :name, :slug],
        include: {
          topics: {
            only: [:id, :name, :slug, :description],
            include: {
              articles: {
                only: [:id, :title, :slug, :summary],
                include: {
                  sections: {
                    only: [:id, :heading, :content, :position]
                  }
                }
              }
            }
          }
        }
      )
    end
  end
end
