require_relative '../spec_helper'

describe SessionsController do
  describe "POST create" do
    it "not to create session when email missing" do
      session_param = {}
      post :create, session: session_param
      expect(response).to render_template("new")
    end

    it "not to create session when email invalid" do
      session_param = { email: 'invalid@example.com' }
      post :create, session: session_param
      expect(response).to render_template("new")
    end

    it "not to create session when wrong password" do
      user = create(:user)
      session_param = { email: user.email, password: 'not_this_time' }
      post :create, session: session_param
      expect(response).to render_template("new")
    end

    it "create session" do
      user = create(:user)
      session_param = { email: user.email, password: 'applift' }
      post :create, session: session_param
      expect(response).not_to render_template("new")
      expect(response).to redirect_to("/users/#{user.id}")
    end
  end
end
