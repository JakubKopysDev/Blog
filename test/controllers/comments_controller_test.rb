require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def setup
    @post = Post.create!(title: 'foobarfoobar', content: 'foobar'*5)
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  def teardown
    @post = nil
  end


  test 'should create comment' do
    assert_difference 'Comment.count', 1 do
      post 'create', {comment: {name: 'Some title', content: 'foobar'*5 }, post_id: @post.id}
    end
  end

  test 'should not create comment' do
    assert_difference 'Comment.count', 0 do
      post 'create', {comment: {name: 'Some title', content: '' }, post_id: @post.id}
    end
  end

end
