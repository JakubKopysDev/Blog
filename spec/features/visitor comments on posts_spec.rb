require 'rails_helper'

RSpec.feature 'Visitor comments on posts', type: :feature do

  before :each do
    @post = FactoryGirl.create(:post)
    @valid_content = 'foobar'*10
  end

  scenario 'with valid name and content' do
    visit post_path @post
    fill_in 'comment[name]', :with => 'valid name'
    fill_in 'comment[content]', :with => @valid_content
    click_button 'Add Comment'

    expect(page).to have_content(@valid_content)
  end

  scenario 'with invalid name' do
    visit post_path @post
    fill_in 'comment[name]', :with => ''
    fill_in 'comment[content]', :with => @valid_content
    click_button 'Add Comment'

    expect(page).not_to have_content(@valid_content)
    expect(page).to     have_content '0 Comments'
  end

  scenario 'with invalid content' do
    visit post_path @post
    fill_in 'comment[name]', :with => 'valid name'
    fill_in 'comment[content]', :with => ''
    click_button 'Add Comment'

    expect(page).not_to have_content(@valid_content)
    expect(page).to     have_content '0 Comments'
  end

end
