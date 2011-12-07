require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:one)
    @blog_entry = blog_entries(:daves_entry)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:comments)
  # end

  test "should create comment" do
    assert_difference('Comment.count', +1) do
      post :create, :comment => @comment.attributes, :blog_entry_id => @blog_entry.id
    end
    
    assert_redirected_to blog_entry_path(@blog_entry)
  end

end
