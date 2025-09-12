require "test_helper"

class Api::KnowledgeBaseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_knowledge_base_index_url
    assert_response :success
  end
end
