require 'spec_helper'

describe "products/index" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :number => "Number",
        :name => "Name",
        :width => 11,
        :height => 22,
        :depth => 33,
        :weight => 44,
        :stock_level => 55
      ),
      stub_model(Product,
        :number => "Number",
        :name => "Name",
        :width => 11,
        :height => 22,
        :depth => 33,
        :weight => 44,
        :stock_level => 55
      )
    ])
  end

  it "renders a list of products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 22.to_s, :count => 2
    assert_select "tr>td", :text => 33.to_s, :count => 2
    assert_select "tr>td", :text => 44.to_s, :count => 2
    assert_select "tr>td", :text => 55.to_s, :count => 2
  end
end
