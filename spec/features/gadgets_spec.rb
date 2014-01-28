require_relative '../spec_helper'

feature 'Gadget,
as a user,
on gadet page,
I can' do

  background do
    @user = create :user
    @gadgets = []
    3.times { @gadgets << create(:gadget, user: @user) }
    sign_in @user
    click_link 'Gadgets'
  end

  scenario 'see a list of gadgets' do
    @gadgets.each do |gadget|
      page.should have_content gadget.name
    end
  end

  scenario 'upload gadget images' do
    click_link @gadgets.first.name
    page.should have_content @gadgets.first.name
    page.should_not have_content @gadgets[1].name
    expect {
      click_on 'Upload'
      attach_file('foobar_attachment', "#{Rails.root}/features/fixtures/test.jpg")
      click_button 'Submit'
      click_on 'Upload'
      attach_file('foobar_attachment', "#{Rails.root}/features/fixtures/test.jpg")
      click_button 'Submit'
    }.to change{@gadets.reload.images.count}.by(2)
  end

end
