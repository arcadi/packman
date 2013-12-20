require 'spec_helper'

describe Api::V1::BoxesController do
  render_views

  # This should return the minimal set of attributes required to create a valid
  # Box. As you add validations to Box, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {"name" => "MyString", "volume" => 100} }
  let(:attributes_keys) { %w[name volume id url].sort }

  describe "GET index" do
    let!(:box) { create(:box) }

    it "should return boxes in json " do
      get :index, {format: 'json'}
      body = JSON.parse(response.body)
      body.should be_a(Array)
      body.first.keys.sort.should == attributes_keys
      body.first["name"].should == box.name
      body.first["volume"].should == box.volume
    end

  end

  describe "GET show" do
    let!(:box) { create(:box) }

    it "assigns the requested box as @box" do
      get :show, {:id => box.to_param}
      assigns(:box).should eq(box)
    end

    it "should return box in json " do
      get :show, {:id => box.to_param}
      body = JSON.parse(response.body)
      body.keys.sort.should == attributes_keys - ["url"]
      body["name"].should == box.name
      body["volume"].should == box.volume
    end

  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Box" do
        expect {
          post :create, {:box => valid_attributes}
        }.to change(Box, :count).by(1)
      end

      it "assigns a newly created box as @box" do
        post :create, {:box => valid_attributes}
        assigns(:box).should be_a(Box)
        assigns(:box).should be_persisted
      end

      it "display created box" do
        post :create, {:box => valid_attributes}
        body = JSON.parse(response.body)
        body.keys.sort.should == attributes_keys - ["url"]
        body["name"].should == valid_attributes["name"]
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved box as @box" do
        # Trigger the behavior that occurs when invalid params are submitted
        Box.any_instance.stub(:save).and_return(false)
        post :create, {:box => {"name" => "invalid value"}}
        assigns(:box).should be_a_new(Box)
      end

      it "renders the 422 error" do
        # Trigger the behavior that occurs when invalid params are submitted
        Box.any_instance.stub(:save).and_return(false)
        post :create, {:box => {"name" => "invalid value"}}
        response.status.should == 422
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested box" do
        box = create(:box)
        Box.any_instance.should_receive(:update).with({"name" => "MyString"})
        put :update, {:id => box.to_param, :box => {"name" => "MyString"}}
      end

      it "assigns the requested box as @box" do
        box = create(:box)
        put :update, {:id => box.to_param, :box => valid_attributes}
        assigns(:box).should eq(box)
      end

    end

    describe "with invalid params" do
      it "assigns the box as @box" do
        box = create(:box)
        # Trigger the behavior that occurs when invalid params are submitted
        Box.any_instance.stub(:save).and_return(false)
        put :update, {:id => box.to_param, :box => {"name" => "invalid value"}}
        assigns(:box).should eq(box)
      end

      it "renders the 422 error" do
        box = create(:box)
        # Trigger the behavior that occurs when invalid params are submitted
        Box.any_instance.stub(:save).and_return(false)
        put :update, {:id => box.to_param, :box => {"number" => "invalid value"}}
        response.status.should == 422
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested box" do
      box = create(:box)
      expect {
        delete :destroy, {:id => box.to_param}
      }.to change(Box, :count).by(-1)
    end

  end

end
