require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :number => "Number",
        :name => "Name",
        :width => 1.5,
        :height => 1.5,
        :depth => 1.5,
        :weight => 1.5,
        :stock_level => 1
      ),
      stub_model(Product,
        :number => "Number",
        :name => "Name",
        :width => 1.5,
        :height => 1.5,
        :depth => 1.5,
        :weight => 1.5,
        :stock_level => 1
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
