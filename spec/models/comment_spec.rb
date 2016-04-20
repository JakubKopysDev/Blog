require 'rails_helper'

describe Comment do

  before :each do
    @comment = FactoryGirl.create(:comment)
    @invalid_comment1 = FactoryGirl.build(:comment, name: '')
    @invalid_comment2 = FactoryGirl.build(:comment, content: '')
  end

  it 'has a valid factory' do
    expect(@comment).to be_valid
  end

  it 'is invalid without a name' do
    expect(@invalid_comment1).not_to be_valid
  end

  it 'is invalid without a content' do
    expect(@invalid_comment2).not_to be_valid
  end

end
