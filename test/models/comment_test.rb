require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @invalid_comment = Comment.new(name: '', content: '')
    @comment = Comment.new(name: 'foobar', content: 'foobar'*20)
  end

  test 'should not save invalid comments' do
    assert_not @invalid_comment.save
  end

  test 'should save valid comments' do
    assert @comment.save
  end

  test 'name should be present' do
    @comment.name = '     '
    assert_not @comment.valid?
  end

  test 'content should be present' do
    @comment.content = '     '
    assert_not @comment.valid?
  end

end
