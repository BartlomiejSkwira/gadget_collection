require_relative '../spec_helper'

feature 'Gadget,
as a user,
on gadet page,
I can' do

  background do
    @user = create :user
    3.times { create(:gadget, user: @user) }
    sign_in @user
    click 'Gadgets'
  end

  scenario 'see a list of gadgets' do
    @user.gadgets.each do |gadget|
      page.should have_content gadget.name
    end
  end

end
