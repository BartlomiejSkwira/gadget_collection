require_relative '../spec_helper'

describe GadgetsController do
  describe "GET index" do
    it "redirect to root user_id is empty" do
      get :index, user_id: ''
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET index" do
    it "throw route exception when no user_id param" do
      expect {
        get :index, user_id: nil
      }.to raise_error
    end
  end

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
