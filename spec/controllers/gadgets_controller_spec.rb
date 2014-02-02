require_relative '../spec_helper'

describe GadgetsController do
  #rspec can't test a nested controller without passing a user_id - which is exactly want we don't want to do here
  #describe "GET index" do
    #it "redirect to root when no user_id param" do
      #get :index
      #expect(response).to redirect_to(root_path)
    #end
  #end

  describe "GET playlist" do
    it "return a list of images in json" do
      user = FactoryGirl.create(:user)
      gadget = FactoryGirl.create(:gadget, user: user)
      image = FactoryGirl.create(:image, gadget: gadget)
      image2 = FactoryGirl.create(:image, gadget: gadget)
      get :playlist, user_id: user.id, id: gadget.id
      json = JSON.parse(response.body)
      expected_reponse = [{"title"=>"test.jpeg", "image"=>"/public/uploads/image/file/#{image.id}/test.jpeg"},{"title"=>"test.jpeg", "image"=>"/public/uploads/image/file/#{image2.id}/test.jpeg"}]
      json.should == expected_reponse
    end
  end
end
