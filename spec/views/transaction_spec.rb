require 'rails_helper'

RSpec.describe 'Transaction page', type: :feature do
  before :each do
    @user = User.new(name: 'Mudasir Sherwani', email: 'mudasir@gmail.com', password: '123456')
    @user.save
    @category = Category.new(name: 'Travel', icon: '✈️')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link 'New Category'
    fill_in 'Name', with: @category.name
    click_button 'Save'
  end

  it 'should be able to see transactions' do
    click_on 'Travel'
    expect(page).to have_content('TRANSACTIONS')
  end
end
