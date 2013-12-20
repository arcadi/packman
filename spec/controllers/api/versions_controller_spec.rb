require 'spec_helper'

describe Api::VersionsController do
  render_views

  describe "GET show" do
    it "should return version of current API" do
      get :show
      JSON.parse(response.body)["current_version"].should == Api::VersionsController::CURRENT_VERSION
    end
  end

end