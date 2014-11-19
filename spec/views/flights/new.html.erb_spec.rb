require 'rails_helper'

RSpec.describe "flights/new", :type => :view do
  before(:each) do
    assign(:flight, Flight.new(
      :user => nil
    ))
  end

  it "renders new flight form" do
    render

    assert_select "form[action=?][method=?]", flights_path, "post" do

      assert_select "input#flight_user_id[name=?]", "flight[user_id]"
    end
  end
end
