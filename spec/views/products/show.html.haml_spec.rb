require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :number => "Number",
      :name => "Name",
      :width => 1.5,
      :height => 1.5,
      :depth => 1.5,
      :weight => 1.5,
      :stock_level => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/Name/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
  end
end
