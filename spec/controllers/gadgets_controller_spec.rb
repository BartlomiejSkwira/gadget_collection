require_relative '../spec_helper'

describe GadgetsController do
  describe "GET index" do
    it "redirect to root when no user_id param" do
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
