require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :number => "MyString",
      :name => "MyString",
      :width => 1.5,
      :height => 1.5,
      :depth => 1.5,
      :weight => 1.5,
      :stock_level => 1
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_number[name=?]", "product[number]"
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_width[name=?]", "product[width]"
      assert_select "input#product_height[name=?]", "product[height]"
      assert_select "input#product_depth[name=?]", "product[depth]"
      assert_select "input#product_weight[name=?]", "product[weight]"
      assert_select "input#product_stock_level[name=?]", "product[stock_level]"
    end
  end
end
