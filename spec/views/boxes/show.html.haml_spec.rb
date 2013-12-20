require 'spec_helper'

describe "boxes/show" do
  before(:each) do
    @box = assign(:box, stub_model(Box,
      :name => "Name",
      :volume => 1
    ))
  end

  it "renders attributes in <p>" do
    render

    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
