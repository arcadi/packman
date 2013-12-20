require 'spec_helper'

describe "Boxes" do
  describe "GET /boxes" do

    it "should return success" do
      get boxes_path
      response.status.should be(200)
    end

  end
end
