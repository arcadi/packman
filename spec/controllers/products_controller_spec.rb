require 'spec_helper'

describe ProductsController do

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

  describe "GET index" do
    it "assigns all products as @products" do
      product = create(:product)
      get :index, {}
      assigns(:products).should eq([product])
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      product = create(:product)
      get :show, {:id => product.to_param}
      assigns(:product).should eq(product)
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      get :new, {}
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      product = create(:product)
      get :edit, {:id => product.to_param}
      assigns(:product).should eq(product)
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

      it "redirects to the created product" do
        post :create, {:product => valid_attributes}
        response.should redirect_to(products_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => {"number" => "invalid value"}}
        assigns(:product).should be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, {:product => {"number" => "invalid value"}}
        response.should render_template("new")
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

      it "redirects to the product" do
        product = create(:product)
        put :update, {:id => product.to_param, :product => valid_attributes}
        response.should redirect_to(products_url)
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

      it "re-renders the 'edit' template" do
        product = create(:product)
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        put :update, {:id => product.to_param, :product => {"number" => "invalid value"}}
        response.should render_template("edit")
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

    it "redirects to the products list" do
      product = create(:product)
      delete :destroy, {:id => product.to_param}
      response.should redirect_to(products_url)
    end
  end


  describe "GET typeahead" do
    it "assigns found products as @products" do
      product1 = create(:product, name: "test")
      product2 = create(:product, name: "test again")
      product3 = create(:product, name: "test three")
      product4 = create(:product, name: "other name")
      get :typeahead, query: "test", exclude: [product3.number], format: 'json'
      assigns(:products).sort.should eq([product1, product2].sort)
    end
  end

end
