require 'spec_helper'

describe "boxes/edit" do
  before(:each) do
    @box = assign(:box, stub_model(Box,
      :name => "MyString",
      :volume => 1
    ))
  end

  it "renders the edit box form" do
    render

    assert_select "form[action=?][method=?]", box_path(@box), "post" do
      assert_select "input#box_name[name=?]", "box[name]"
      assert_select "input#box_volume[name=?]", "box[volume]"
    end
  end
end
