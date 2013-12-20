require 'spec_helper'

describe "products/show" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :number => "Number",
      :name => "Name",
      :width => 11,
      :height => 22,
      :depth => 33,
      :weight => 44,
      :stock_level => 55
    ))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Number/)
    rendered.should match(/Name/)
    rendered.should match(/11/)
    rendered.should match(/22/)
    rendered.should match(/33/)
    rendered.should match(/44/)
    rendered.should match(/55/)
  end
end
