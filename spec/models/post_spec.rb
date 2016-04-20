require 'rails_helper'

describe Post do

  before do
    @post = Post.create!(title: 'foobar1', content: 'foobar'*5)
  end

  it 'has a valid factory' do
    post = FactoryGirl.create(:post)
    expect(post).to be_valid
  end

  it 'orders by creation date' do
    @new_post = Post.create!(title: 'foobar2', content: 'foobar'*5)
    posts = Post.all.order('created_at desc').to_a
    expect(posts).to eq([@new_post, @post])
  end

  it 'is invalid without a title' do
    invalid_post = FactoryGirl.build(:post, title: '')
    expect(invalid_post).not_to be_valid
  end

  it 'is invalid without a content' do
    invalid_post = FactoryGirl.build(:post, title: '')
    expect(invalid_post).not_to be_valid
  end

end