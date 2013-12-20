require 'spec_helper'

describe "Products" do
  describe "GET /products" do

    it "should return success" do
      get products_path
      response.status.should be(200)
    end

  end
end
