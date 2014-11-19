require 'rails_helper'

RSpec.describe "flights/index", :type => :view do
  before(:each) do
    assign(:flights, [
      Flight.create!(
        :user => nil
      ),
      Flight.create!(
        :user => nil
      )
    ])
  end

  it "renders a list of flights" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
