require 'spec_helper'

describe "boxes/index" do
  before(:each) do
    assign(:boxes, [
      stub_model(Box,
        :name => "BigBox",
        :volume => 555
      ),
      stub_model(Box,
        :name => "BigBox",
        :volume => 555
      )
    ])
  end

  it "renders a list of boxes" do
    render

    assert_select "tr>td>a", :text => "BigBox", :count => 2
    assert_select "tr>td", :text => 555.to_s, :count => 2
  end
end
