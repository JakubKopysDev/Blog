require 'rails_helper'

describe Post do

  before do
    @post = Post.create!(title: 'foobar1', content: 'foobar'*5)
  end

  it 'orders by creation date' do
    @new_post = Post.create!(title: 'foobar2', content: 'foobar'*5)
    Post.all.order('created_at desc').to_a.should == ([@new_post, @post])
  end
  
end
