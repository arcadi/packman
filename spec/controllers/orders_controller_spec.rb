require 'spec_helper'

describe OrdersController do
  let(:product) { create(:product) }
  let(:box) { create(:box) }
  let(:valid_attributes) {
    {
      "box" => box.id,
      "item" => {
        "number" => product.number,
        "name" => product.name,
        "counter" => product.stock_level
      }
    }
  }


  describe "GET 'new'" do
    it "assigns a new order as @order" do
      get :new
      assigns(:order).should be_a(Order)
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post :create, order: valid_attributes
      response.should be_success
    end
  end

end
