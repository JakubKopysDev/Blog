require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @invalid_post = Post.new(title: '', content: '')
    @post = Post.new(title: 'foobar', content: 'foobar'*20)
  end

  test 'should not save invalid posts' do
    assert_not @invalid_post.save
  end

  test 'should save valid post' do
    assert @post.save
  end

  test 'title should be present' do
    @post.title = '     '
    assert_not @post.valid?
  end

  test 'content should be present' do
    @post.content = '     '
    assert_not @post.valid?
  end

end
