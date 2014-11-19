require 'rails_helper'

RSpec.describe "flights/show", :type => :view do
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
