require_relative '../spec_helper'

feature 'Gadget,
as a user,
on gadet page,
I can' do

  background do
    Capybara.current_driver = :selenium
    @user = create :user
    @gadgets = []
    3.times { @gadgets << create(:gadget, user: @user) }
    sign_in_user @user
    click_link 'Gadgets'
  end

  scenario 'see a list of gadgets' do
    @user.gadgets.each do |gadget|
      page.should have_content gadget.name
    end
  end

  scenario 'edit/upload gadget images' do
    click_link @gadgets.first.name
    page.should have_field 'Name', with: @gadgets.first.name
    page.should_not have_content @gadgets[1].name
    expect {
      click_link 'Upload'
      first_id = all('.image-attachment')[0]['id']
      attach_file(first_id, "#{Rails.root}/spec/features/fixtures/test.jpeg")
      click_on 'Upload'
      second_id = all('.image-attachment')[1]['id']
      attach_file(second_id, "#{Rails.root}/spec/features/fixtures/test.jpeg")
      click_on 'Save'
    }.to change{@gadgets.first.reload.images.count}.by(2)
  end

  scenario 'create a new gadget' do
    click_link 'Create gadget'
    fill_in 'Name', with: 'Funky thing'
    click_link 'Upload'
    first_id = all('.image-attachment')[0]['id']
    attach_file(first_id, "#{Rails.root}/spec/features/fixtures/test.jpeg")
    expect {
      click_on 'Save'
    }.to change{Gadget.count}.by(1)
  end

  scenario 'see a cover flow container for images' do
    visit edit_user_gadget_path(@gadgets.first, user_id: @user.id)
    page.should_not have_css('#player')
    image = create(:image, gadget: @gadgets.first)
    image2 = create(:image, gadget: @gadgets.first)
    visit edit_user_gadget_path(@gadgets.first, user_id: @user.id)
    page.should have_css('#player')
  end
end
