require 'spec_helper'

describe Api::V1::ProductsController do
  render_views

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      "number" => "111-222",
      "name" => "product name",
      "width" => 1,
      "height" => 1,
      "depth" => 1,
      "weight" => 1,
      "stock_level" => 1
    }
  }

  let(:attributes_keys) { (valid_attributes.keys + ["volume", "url"]).sort }

  describe "GET index" do
    let!(:product) { create(:product) }

    it "should return products in json " do
      get :index, {format: 'json'}
      body = JSON.parse(response.body)
      body.should be_a(Array)
      body.first.keys.sort.should == attributes_keys
      body.first["name"].should == product.name
      body.first["number"].should == product.number
    end
  end

  describe "GET show" do
    let!(:product) { create(:product) }

    it "assigns the requested product as @product" do
      get :show, {:id => product.to_param}
      assigns(:product).should eq(product)
    end

    it "should return product in json " do
      get :show, {:id => product.to_param}
      body = JSON.parse(response.body)
      body.keys.sort.should == attributes_keys - ["url"]
      body["name"].should == product.name
      body["number"].should == product.number
    end

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, {:product => valid_attributes}
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, {:product => valid_attributes}
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "display created product" do
        post :create, {:product => valid_attributes}
        body = JSON.parse(response.body)
        body.keys.sort.should == attributes_keys - ["url"]
        body["name"].should == valid_attributes["name"]
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => {"number" => "invalid value"}}
        assigns(:product).should be_a_new(Product)
      end

      it "renders the 422 error" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => {"name" => "invalid value"}}
        response.status.should == 422
      end

    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product" do
        product = create(:product)
        # Assuming there are no other products in the database, this
        # specifies that the Product created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Product.any_instance.should_receive(:update).with({"number" => "MyString"})
        put :update, {:id => product.to_param, :product => {"number" => "MyString"}}
      end

      it "assigns the requested product as @product" do
        product = create(:product)
        put :update, {:id => product.to_param, :product => valid_attributes}
        assigns(:product).should eq(product)
      end

    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        product = create(:product)
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :product => {"number" => "invalid value"}}
        assigns(:product).should eq(product)
      end

      it "renders the 422 error" do
        product = create(:product)
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :product => {"name" => "invalid value"}}
        response.status.should == 422
      end

    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product" do
      product = create(:product)
      expect {
        delete :destroy, {:id => product.to_param}
      }.to change(Product, :count).by(-1)
    end

  end

end
