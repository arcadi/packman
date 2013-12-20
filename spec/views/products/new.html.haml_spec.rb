require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :number => "MyString",
      :name => "MyString",
      :width => 1.5,
      :height => 1.5,
      :depth => 1.5,
      :weight => 1.5,
      :stock_level => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do
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
