require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test 'should create post' do
    assert_difference 'Post.count', 1 do
      post :create, post: {title: 'Some title', content: 'foobar'*20}
    end
  end

  test 'should not create post' do
    assert_difference 'Post.count', 0 do
      post :create, post: {title: '', content: 'foobar'*20}
    end
  end

end
