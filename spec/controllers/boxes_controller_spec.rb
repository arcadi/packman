require 'spec_helper'

describe BoxesController do

  # This should return the minimal set of attributes required to create a valid
  # Box. As you add validations to Box, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {"name" => "MyString", "volume" => 100} }

  describe "GET index" do
    it "assigns all boxes as @boxes" do
      box = create(:box)
      get :index, {}
      assigns(:boxes).should eq([box])
    end
  end

  describe "GET show" do
    it "assigns the requested box as @box" do
      box = create(:box)
      get :show, {:id => box.to_param}
      assigns(:box).should eq(box)
    end
  end

  describe "GET new" do
    it "assigns a new box as @box" do
      get :new, {}
      assigns(:box).should be_a_new(Box)
    end
  end

  describe "GET edit" do
    it "assigns the requested box as @box" do
      box = create(:box)
      get :edit, {:id => box.to_param}
      assigns(:box).should eq(box)
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

      it "redirects to the created box" do
        post :create, {:box => valid_attributes}
        response.should redirect_to(boxes_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved box as @box" do
        # Trigger the behavior that occurs when invalid params are submitted
        Box.any_instance.stub(:save).and_return(false)
        post :create, {:box => {"name" => "invalid value"}}
        assigns(:box).should be_a_new(Box)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Box.any_instance.stub(:save).and_return(false)
        post :create, {:box => {"name" => "invalid value"}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested box" do
        box = create(:box)
        # Assuming there are no other boxes in the database, this
        # specifies that the Box created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Box.any_instance.should_receive(:update).with({"name" => "MyString"})
        put :update, {:id => box.to_param, :box => {"name" => "MyString"}}
      end

      it "assigns the requested box as @box" do
        box = create(:box)
        put :update, {:id => box.to_param, :box => valid_attributes}
        assigns(:box).should eq(box)
      end

      it "redirects to the boxes list" do
        box = create(:box)
        put :update, {:id => box.to_param, :box => valid_attributes}
        response.should redirect_to(boxes_path)
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

      it "re-renders the 'edit' template" do
        box = create(:box)
        # Trigger the behavior that occurs when invalid params are submitted
        Box.any_instance.stub(:save).and_return(false)
        put :update, {:id => box.to_param, :box => {"name" => "invalid value"}}
        response.should render_template("edit")
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

    it "redirects to the boxes list" do
      box = create(:box)
      delete :destroy, {:id => box.to_param}
      response.should redirect_to(boxes_path)
    end
  end

end
